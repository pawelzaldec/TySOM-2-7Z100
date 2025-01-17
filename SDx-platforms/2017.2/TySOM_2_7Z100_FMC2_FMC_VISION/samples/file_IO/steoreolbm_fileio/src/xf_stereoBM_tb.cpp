/***************************************************************************
Copyright (c) 2016, Xilinx, Inc.
All rights reserved.

Redistribution and use in source and binary forms, with or without modification, 
are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, 
this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, 
this list of conditions and the following disclaimer in the documentation 
and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors 
may be used to endorse or promote products derived from this software 
without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND 
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, 
THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. 
IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, 
INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, 
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) 
HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, 
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, 
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

 ***************************************************************************/
#include "xf_headers.h"
#include "xf_stereoBM_config.h"

using namespace std;

int main(int argc, char** argv)
{
	cv::setUseOptimized(false);

	if(argc != 3)
	{
		fprintf(stderr,"Usage incorrect. Correct usage: ./exe <left image> <right image>\n");
		return -1;
	}

	cv::Mat left_img, right_img;

	left_img = cv::imread(argv[1],0);
	if(!left_img.data)
	{
		printf("Failed to load left image ... %s\n!", argv[1]);
		return -1;
	}
	right_img = cv::imread(argv[2],0);
	if(!right_img.data)
	{
		printf("Failed to load right image ... %s\n!", argv[2]);
		return -1;
	}

	cv::Mat disp;

	//////////////////      OCV reference Function ////////////////////////
#if __SDSCC__
	cv::Ptr<cv::StereoBM> stereobm = cv::StereoBM::create(NO_OF_DISPARITIES,SAD_WINDOW_SIZE);
	stereobm-> setPreFilterCap(31);
	stereobm-> setUniquenessRatio(15);
	stereobm-> setTextureThreshold(20);
	stereobm-> compute(left_img,right_img,disp);
#else
	cv::StereoBM bm;
	bm.state->preFilterCap = 31;
	bm.state->preFilterType = CV_STEREO_BM_XSOBEL;
	bm.state->SADWindowSize = SAD_WINDOW_SIZE;
	bm.state->minDisparity = 0;
	bm.state->numberOfDisparities = NO_OF_DISPARITIES;
	bm.state->textureThreshold = 20;
	bm.state->uniquenessRatio = 15;
	bm(left_img,right_img,disp);
#endif

	cv::Mat disp8;
	disp.convertTo(disp8, CV_8U, (256.0/NO_OF_DISPARITIES)/(16.));
	imwrite("ocv_output.png",disp8);

	//////////////////	HLS TOP Function Call  ////////////////////////
	xF::Mat<XF_8UC1, XF_HEIGHT, XF_WIDTH, XF_NPPC1> leftMat(left_img.rows,left_img.cols);
	xF::Mat<XF_8UC1, XF_HEIGHT, XF_WIDTH, XF_NPPC1> rightMat(left_img.rows,left_img.cols);
	xF::Mat<XF_16UC1, XF_HEIGHT, XF_WIDTH, XF_NPPC1> dispMat(left_img.rows,left_img.cols);

	leftMat.copyTo(left_img.data);
	rightMat.copyTo(right_img.data);

	xF::xFSBMState<SAD_WINDOW_SIZE,NO_OF_DISPARITIES,PARALLEL_UNITS> bm_state;
	bm_state.preFilterCap = 31;
	bm_state.uniquenessRatio = 15;
	bm_state.textureThreshold = 20;
	bm_state.minDisparity = 0;

#if __SDSCC__
		TIME_STAMP_INIT
#endif
	stereolbm_accel(leftMat, rightMat, dispMat, bm_state);
#if __SDSCC__
		TIME_STAMP
#endif

	cv::Mat out_disp_16(left_img.rows,left_img.cols,CV_16UC1);
	cv::Mat out_disp_img(left_img.rows,left_img.cols,CV_8UC1);
//	out_disp_16.data = dispMat.copyFrom();
	for (int i=0; i<left_img.rows; i++)
	{
		for (int j=0; j<left_img.cols; j++)
		{
			out_disp_16.at<unsigned short>(i,j) = (unsigned short)dispMat.data[i*left_img.cols+j];
		}
	}
	out_disp_16.convertTo(out_disp_img, CV_8U, (256.0/NO_OF_DISPARITIES)/(16.));

	imwrite("hls_output.png",out_disp_img);

	int cnt=0, total = 0;

	for(int i=(SAD_WINDOW_SIZE>>1)+20; i<out_disp_img.rows-((SAD_WINDOW_SIZE>>1)+20); i++)
	{
		for(int j=(NO_OF_DISPARITIES-1)+(SAD_WINDOW_SIZE>>1)+20; j<out_disp_img.cols-((SAD_WINDOW_SIZE>>1)+20); j++)
		{
			total ++;
			int diff = (disp8.at<unsigned char> (i,j))-(out_disp_img.at<unsigned char>(i,j));
			if (diff < 0) diff = -diff;
			if(diff > 0) {
				cnt++;
			}
		}
	}
	float percentage = ((float)cnt / (float)total) * 100.0;
	printf("Error Percentage = %f%% \n", percentage);

	if (percentage > 0.0f)
		return -1;

	printf ("run complete !\n");
	return 0;
}
