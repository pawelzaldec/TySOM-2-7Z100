#*****************************************************************************************
# Vivado (TM) v2017.2_sdx (64-bit)
#
# rebuild.tcl: Tcl script for re-creating project 'TySOM_2_7Z100'
#
# Generated by Vivado on Thu Oct 12 16:04:35 CEST 2017
# IP Build 1971916 on Wed Aug 23 13:11:02 MDT 2017
#
# This file contains the Vivado Tcl commands for re-creating the project to the state*
# when this script was generated. In order to re-create the project, please source this
# file in the Vivado Tcl Shell.
#
# * Note that the runs in the created project will be configured the same way as the
#   original project, however they will not be launched automatically. To regenerate the
#   run results please launch the synthesis/implementation runs as needed.
#
#*****************************************************************************************

# Set the reference directory for source file relative paths (by default the value is script directory path)
set origin_dir "."

# Use origin directory path location variable, if specified in the tcl shell
if { [info exists ::origin_dir_loc] } {
  set origin_dir $::origin_dir_loc
}

variable script_file
set script_file "rebuild.tcl"

# Help information for this script
proc help {} {
  variable script_file
  puts "\nDescription:"
  puts "Recreate a Vivado project from this script. The created project will be"
  puts "functionally equivalent to the original project for which this script was"
  puts "generated. The script contains commands for creating a project, filesets,"
  puts "runs, adding/importing sources and setting properties on various objects.\n"
  puts "Syntax:"
  puts "$script_file"
  puts "$script_file -tclargs \[--origin_dir <path>\]"
  puts "$script_file -tclargs \[--help\]\n"
  puts "Usage:"
  puts "Name                   Description"
  puts "-------------------------------------------------------------------------"
  puts "\[--origin_dir <path>\]  Determine source file paths wrt this path. Default"
  puts "                       origin_dir path value is \".\", otherwise, the value"
  puts "                       that was set with the \"-origin_dir_override\" switch"
  puts "                       when this script was generated.\n"
  puts "\[--help\]               Print help information for this script"
  puts "-------------------------------------------------------------------------\n"
  exit 0
}

if { $::argc > 0 } {
  for {set i 0} {$i < [llength $::argc]} {incr i} {
    set option [string trim [lindex $::argv $i]]
    switch -regexp -- $option {
      "--origin_dir" { incr i; set origin_dir [lindex $::argv $i] }
      "--help"       { help }
      default {
        if { [regexp {^-} $option] } {
          puts "ERROR: Unknown option '$option' specified, please type '$script_file -tclargs --help' for usage info.\n"
          return 1
        }
      }
    }
  }
}

# Set the directory path for the original project from where this script was exported
set orig_proj_dir "[file normalize "$origin_dir/../"]"

# Create project
create_project TySOM_2_7Z100 ./TySOM_2_7Z100 -part xc7z100ffg900-2

# Set the directory path for the new project
set proj_dir [get_property directory [current_project]]

# Reconstruct message rules
# None

# Set project properties
set obj [get_projects TySOM_2_7Z100]
set_property -name "default_lib" -value "xil_defaultlib" -objects $obj
set_property -name "ip_cache_permissions" -value "read write" -objects $obj
set_property -name "ip_output_repo" -value "$proj_dir/TySOM_2_7Z100.cache/ip" -objects $obj
set_property -name "part" -value "xc7z100ffg900-2" -objects $obj
set_property -name "sim.ip.auto_export_scripts" -value "1" -objects $obj
set_property -name "simulator_language" -value "Mixed" -objects $obj
set_property -name "xpm_libraries" -value "XPM_CDC XPM_FIFO XPM_MEMORY" -objects $obj

# Create 'sources_1' fileset (if not found)
if {[string equal [get_filesets -quiet sources_1] ""]} {
  create_fileset -srcset sources_1
}

# Set IP repository paths
set obj [get_filesets sources_1]
set_property "ip_repo_paths" "[file normalize "$origin_dir/../TySOM_2_7Z100.ipdefs/TySOM_2_7Z100.ipdefs_0"]" $obj

# Rebuild user ip_repo's index before adding any source files
update_ip_catalog -rebuild

# Set 'sources_1' fileset object
set obj [get_filesets sources_1]
# Import local files from the original project
set files [list \
 "[file normalize "$origin_dir/sources_1/bd/TySOM_2_7Z100/TySOM_2_7Z100.bd"]"\
 "[file normalize "$origin_dir/sources_1/bd/TySOM_2_7Z100/hdl/TySOM_2_7Z100_wrapper.v"]"\
 "[file normalize "$origin_dir/sources_1/bd/TySOM_2_7Z100/ip/TySOM_2_7Z100_adi_axi_clkgen_0_0/TySOM_2_7Z100_adi_axi_clkgen_0_0.upgrade_log"]"\
 "[file normalize "$origin_dir/sources_1/bd/TySOM_2_7Z100/ip/TySOM_2_7Z100_axi_gpio_0_0/TySOM_2_7Z100_axi_gpio_0_0.upgrade_log"]"\
 "[file normalize "$origin_dir/sources_1/bd/TySOM_2_7Z100/ip/TySOM_2_7Z100_axi_gpio_0_2/TySOM_2_7Z100_axi_gpio_0_2.upgrade_log"]"\
 "[file normalize "$origin_dir/sources_1/bd/TySOM_2_7Z100/ip/TySOM_2_7Z100_axi_gpio_0_3/TySOM_2_7Z100_axi_gpio_0_3.upgrade_log"]"\
 "[file normalize "$origin_dir/sources_1/bd/TySOM_2_7Z100/ip/TySOM_2_7Z100_axi_iic_0_0/TySOM_2_7Z100_axi_iic_0_0.upgrade_log"]"\
 "[file normalize "$origin_dir/sources_1/bd/TySOM_2_7Z100/ip/TySOM_2_7Z100_axi_interconnect_0_0/TySOM_2_7Z100_axi_interconnect_0_0.upgrade_log"]"\
 "[file normalize "$origin_dir/sources_1/bd/TySOM_2_7Z100/ip/TySOM_2_7Z100_axi_interconnect_1_0/TySOM_2_7Z100_axi_interconnect_1_0.upgrade_log"]"\
 "[file normalize "$origin_dir/sources_1/bd/TySOM_2_7Z100/ip/TySOM_2_7Z100_axi_protocol_converter_0_0/TySOM_2_7Z100_axi_protocol_converter_0_0.upgrade_log"]"\
 "[file normalize "$origin_dir/sources_1/bd/TySOM_2_7Z100/ip/TySOM_2_7Z100_axi_vdma_0_0/TySOM_2_7Z100_axi_vdma_0_0.upgrade_log"]"\
 "[file normalize "$origin_dir/sources_1/bd/TySOM_2_7Z100/ip/TySOM_2_7Z100_axi_vdma_0_1/TySOM_2_7Z100_axi_vdma_0_1.upgrade_log"]"\
 "[file normalize "$origin_dir/sources_1/bd/TySOM_2_7Z100/ip/TySOM_2_7Z100_axi_vdma_0_2/TySOM_2_7Z100_axi_vdma_0_2.upgrade_log"]"\
 "[file normalize "$origin_dir/sources_1/bd/TySOM_2_7Z100/ip/TySOM_2_7Z100_axi_vdma_0_3/TySOM_2_7Z100_axi_vdma_0_3.upgrade_log"]"\
 "[file normalize "$origin_dir/sources_1/bd/TySOM_2_7Z100/ip/TySOM_2_7Z100_axi_vdma_0_4/TySOM_2_7Z100_axi_vdma_0_4.upgrade_log"]"\
 "[file normalize "$origin_dir/sources_1/bd/TySOM_2_7Z100/ip/TySOM_2_7Z100_axi_vdma_0_5/TySOM_2_7Z100_axi_vdma_0_5.upgrade_log"]"\
 "[file normalize "$origin_dir/sources_1/bd/TySOM_2_7Z100/ip/TySOM_2_7Z100_axis_subset_converter_0_0/TySOM_2_7Z100_axis_subset_converter_0_0.upgrade_log"]"\
 "[file normalize "$origin_dir/sources_1/bd/TySOM_2_7Z100/ip/TySOM_2_7Z100_clk_wiz_0_1/TySOM_2_7Z100_clk_wiz_0_1.upgrade_log"]"\
 "[file normalize "$origin_dir/sources_1/bd/TySOM_2_7Z100/ip/TySOM_2_7Z100_clk_wiz_0_2/TySOM_2_7Z100_clk_wiz_0_2.upgrade_log"]"\
 "[file normalize "$origin_dir/sources_1/bd/TySOM_2_7Z100/ip/TySOM_2_7Z100_clk_wiz_0_3/TySOM_2_7Z100_clk_wiz_0_3.upgrade_log"]"\
 "[file normalize "$origin_dir/sources_1/bd/TySOM_2_7Z100/ip/TySOM_2_7Z100_clk_wiz_0_4/TySOM_2_7Z100_clk_wiz_0_4.upgrade_log"]"\
 "[file normalize "$origin_dir/sources_1/bd/TySOM_2_7Z100/ip/TySOM_2_7Z100_clk_wiz_0_5/TySOM_2_7Z100_clk_wiz_0_5.upgrade_log"]"\
 "[file normalize "$origin_dir/sources_1/bd/TySOM_2_7Z100/ip/TySOM_2_7Z100_ov10635_decoder_core_0_0/TySOM_2_7Z100_ov10635_decoder_core_0_0.upgrade_log"]"\
 "[file normalize "$origin_dir/sources_1/bd/TySOM_2_7Z100/ip/TySOM_2_7Z100_ov10635_decoder_core_1_1/TySOM_2_7Z100_ov10635_decoder_core_1_1.upgrade_log"]"\
 "[file normalize "$origin_dir/sources_1/bd/TySOM_2_7Z100/ip/TySOM_2_7Z100_ov10635_decoder_core_2_0/TySOM_2_7Z100_ov10635_decoder_core_2_0.upgrade_log"]"\
 "[file normalize "$origin_dir/sources_1/bd/TySOM_2_7Z100/ip/TySOM_2_7Z100_ov10635_decoder_core_3_0/TySOM_2_7Z100_ov10635_decoder_core_3_0.upgrade_log"]"\
 "[file normalize "$origin_dir/sources_1/bd/TySOM_2_7Z100/ip/TySOM_2_7Z100_ov10635_decoder_core_4_0/TySOM_2_7Z100_ov10635_decoder_core_4_0.upgrade_log"]"\
 "[file normalize "$origin_dir/sources_1/bd/TySOM_2_7Z100/ip/TySOM_2_7Z100_proc_sys_reset_0_0/TySOM_2_7Z100_proc_sys_reset_0_0.upgrade_log"]"\
 "[file normalize "$origin_dir/sources_1/bd/TySOM_2_7Z100/ip/TySOM_2_7Z100_proc_sys_reset_0_1/TySOM_2_7Z100_proc_sys_reset_0_1.upgrade_log"]"\
 "[file normalize "$origin_dir/sources_1/bd/TySOM_2_7Z100/ip/TySOM_2_7Z100_proc_sys_reset_0_2/TySOM_2_7Z100_proc_sys_reset_0_2.upgrade_log"]"\
 "[file normalize "$origin_dir/sources_1/bd/TySOM_2_7Z100/ip/TySOM_2_7Z100_proc_sys_reset_0_3/TySOM_2_7Z100_proc_sys_reset_0_3.upgrade_log"]"\
 "[file normalize "$origin_dir/sources_1/bd/TySOM_2_7Z100/ip/TySOM_2_7Z100_proc_sys_reset_0_4/TySOM_2_7Z100_proc_sys_reset_0_4.upgrade_log"]"\
 "[file normalize "$origin_dir/sources_1/bd/TySOM_2_7Z100/ip/TySOM_2_7Z100_proc_sys_reset_0_5/TySOM_2_7Z100_proc_sys_reset_0_5.upgrade_log"]"\
 "[file normalize "$origin_dir/sources_1/bd/TySOM_2_7Z100/ip/TySOM_2_7Z100_proc_sys_reset_0_6/TySOM_2_7Z100_proc_sys_reset_0_6.upgrade_log"]"\
 "[file normalize "$origin_dir/sources_1/bd/TySOM_2_7Z100/ip/TySOM_2_7Z100_proc_sys_reset_0_7/TySOM_2_7Z100_proc_sys_reset_0_7.upgrade_log"]"\
 "[file normalize "$origin_dir/sources_1/bd/TySOM_2_7Z100/ip/TySOM_2_7Z100_proc_sys_reset_1_0/TySOM_2_7Z100_proc_sys_reset_1_0.upgrade_log"]"\
 "[file normalize "$origin_dir/sources_1/bd/TySOM_2_7Z100/ip/TySOM_2_7Z100_processing_system7_0_0/TySOM_2_7Z100_processing_system7_0_0.upgrade_log"]"\
 "[file normalize "$origin_dir/sources_1/bd/TySOM_2_7Z100/ip/TySOM_2_7Z100_util_ds_buf_0_0/TySOM_2_7Z100_util_ds_buf_0_0.upgrade_log"]"\
 "[file normalize "$origin_dir/sources_1/bd/TySOM_2_7Z100/ip/TySOM_2_7Z100_util_ds_buf_1_0/TySOM_2_7Z100_util_ds_buf_1_0.upgrade_log"]"\
 "[file normalize "$origin_dir/sources_1/bd/TySOM_2_7Z100/ip/TySOM_2_7Z100_util_ds_buf_2_0/TySOM_2_7Z100_util_ds_buf_2_0.upgrade_log"]"\
 "[file normalize "$origin_dir/sources_1/bd/TySOM_2_7Z100/ip/TySOM_2_7Z100_util_ds_buf_3_0/TySOM_2_7Z100_util_ds_buf_3_0.upgrade_log"]"\
 "[file normalize "$origin_dir/sources_1/bd/TySOM_2_7Z100/ip/TySOM_2_7Z100_util_ds_buf_4_0/TySOM_2_7Z100_util_ds_buf_4_0.upgrade_log"]"\
 "[file normalize "$origin_dir/sources_1/bd/TySOM_2_7Z100/ip/TySOM_2_7Z100_v_axi4s_vid_out_0_0/TySOM_2_7Z100_v_axi4s_vid_out_0_0.upgrade_log"]"\
 "[file normalize "$origin_dir/sources_1/bd/TySOM_2_7Z100/ip/TySOM_2_7Z100_v_cresample_0_0/TySOM_2_7Z100_v_cresample_0_0.upgrade_log"]"\
 "[file normalize "$origin_dir/sources_1/bd/TySOM_2_7Z100/ip/TySOM_2_7Z100_v_osd_0_0/TySOM_2_7Z100_v_osd_0_0.upgrade_log"]"\
 "[file normalize "$origin_dir/sources_1/bd/TySOM_2_7Z100/ip/TySOM_2_7Z100_v_rgb2ycrcb_0_0/TySOM_2_7Z100_v_rgb2ycrcb_0_0.upgrade_log"]"\
 "[file normalize "$origin_dir/sources_1/bd/TySOM_2_7Z100/ip/TySOM_2_7Z100_v_tc_0_0/TySOM_2_7Z100_v_tc_0_0.upgrade_log"]"\
 "[file normalize "$origin_dir/sources_1/bd/TySOM_2_7Z100/ip/TySOM_2_7Z100_v_vid_in_axi4s_0_0/TySOM_2_7Z100_v_vid_in_axi4s_0_0.upgrade_log"]"\
 "[file normalize "$origin_dir/sources_1/bd/TySOM_2_7Z100/ip/TySOM_2_7Z100_v_vid_in_axi4s_0_1/TySOM_2_7Z100_v_vid_in_axi4s_0_1.upgrade_log"]"\
 "[file normalize "$origin_dir/sources_1/bd/TySOM_2_7Z100/ip/TySOM_2_7Z100_v_vid_in_axi4s_0_2/TySOM_2_7Z100_v_vid_in_axi4s_0_2.upgrade_log"]"\
 "[file normalize "$origin_dir/sources_1/bd/TySOM_2_7Z100/ip/TySOM_2_7Z100_v_vid_in_axi4s_0_3/TySOM_2_7Z100_v_vid_in_axi4s_0_3.upgrade_log"]"\
 "[file normalize "$origin_dir/sources_1/bd/TySOM_2_7Z100/ip/TySOM_2_7Z100_v_vid_in_axi4s_0_4/TySOM_2_7Z100_v_vid_in_axi4s_0_4.upgrade_log"]"\
 "[file normalize "$origin_dir/sources_1/bd/TySOM_2_7Z100/ip/TySOM_2_7Z100_xlconcat_0_0/TySOM_2_7Z100_xlconcat_0_0.upgrade_log"]"\
 "[file normalize "$origin_dir/sources_1/bd/TySOM_2_7Z100/ip/TySOM_2_7Z100_xlconstant_0_0/TySOM_2_7Z100_xlconstant_0_0.upgrade_log"]"\
 "[file normalize "$origin_dir/sources_1/bd/TySOM_2_7Z100/ip/TySOM_2_7Z100_xlconstant_0_1/TySOM_2_7Z100_xlconstant_0_1.upgrade_log"]"\
 "[file normalize "$origin_dir/sources_1/bd/TySOM_2_7Z100/ip/TySOM_2_7Z100_xlslice_0_4/TySOM_2_7Z100_xlslice_0_4.upgrade_log"]"\
 "[file normalize "$origin_dir/sources_1/bd/TySOM_2_7Z100/ip/TySOM_2_7Z100_xlslice_0_5/TySOM_2_7Z100_xlslice_0_5.upgrade_log"]"\
 "[file normalize "$origin_dir/sources_1/bd/TySOM_2_7Z100/ip/TySOM_2_7Z100_xlslice_0_6/TySOM_2_7Z100_xlslice_0_6.upgrade_log"]"\
 "[file normalize "$origin_dir/sources_1/bd/TySOM_2_7Z100/ip/TySOM_2_7Z100_xlslice_0_7/TySOM_2_7Z100_xlslice_0_7.upgrade_log"]"\
 "[file normalize "$origin_dir/sources_1/bd/TySOM_2_7Z100/ip/TySOM_2_7Z100_xlslice_0_8/TySOM_2_7Z100_xlslice_0_8.upgrade_log"]"\
]
set imported_files [import_files -fileset sources_1 $files]

# Set 'sources_1' fileset file properties for remote files
# None

# Set 'sources_1' fileset file properties for local files
set file "TySOM_2_7Z100_adi_axi_clkgen_0_0/TySOM_2_7Z100_adi_axi_clkgen_0_0.upgrade_log"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "IP Update Log" -objects $file_obj

set file "TySOM_2_7Z100_axi_gpio_0_0/TySOM_2_7Z100_axi_gpio_0_0.upgrade_log"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "IP Update Log" -objects $file_obj

set file "TySOM_2_7Z100_axi_gpio_0_2/TySOM_2_7Z100_axi_gpio_0_2.upgrade_log"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "IP Update Log" -objects $file_obj

set file "TySOM_2_7Z100_axi_gpio_0_3/TySOM_2_7Z100_axi_gpio_0_3.upgrade_log"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "IP Update Log" -objects $file_obj

set file "TySOM_2_7Z100_axi_iic_0_0/TySOM_2_7Z100_axi_iic_0_0.upgrade_log"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "IP Update Log" -objects $file_obj

set file "TySOM_2_7Z100_axi_interconnect_0_0/TySOM_2_7Z100_axi_interconnect_0_0.upgrade_log"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "IP Update Log" -objects $file_obj

set file "TySOM_2_7Z100_axi_interconnect_1_0/TySOM_2_7Z100_axi_interconnect_1_0.upgrade_log"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "IP Update Log" -objects $file_obj

set file "TySOM_2_7Z100_axi_protocol_converter_0_0/TySOM_2_7Z100_axi_protocol_converter_0_0.upgrade_log"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "IP Update Log" -objects $file_obj

set file "TySOM_2_7Z100_axi_vdma_0_0/TySOM_2_7Z100_axi_vdma_0_0.upgrade_log"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "IP Update Log" -objects $file_obj

set file "TySOM_2_7Z100_axi_vdma_0_1/TySOM_2_7Z100_axi_vdma_0_1.upgrade_log"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "IP Update Log" -objects $file_obj

set file "TySOM_2_7Z100_axi_vdma_0_2/TySOM_2_7Z100_axi_vdma_0_2.upgrade_log"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "IP Update Log" -objects $file_obj

set file "TySOM_2_7Z100_axi_vdma_0_3/TySOM_2_7Z100_axi_vdma_0_3.upgrade_log"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "IP Update Log" -objects $file_obj

set file "TySOM_2_7Z100_axi_vdma_0_4/TySOM_2_7Z100_axi_vdma_0_4.upgrade_log"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "IP Update Log" -objects $file_obj

set file "TySOM_2_7Z100_axi_vdma_0_5/TySOM_2_7Z100_axi_vdma_0_5.upgrade_log"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "IP Update Log" -objects $file_obj

set file "TySOM_2_7Z100_axis_subset_converter_0_0/TySOM_2_7Z100_axis_subset_converter_0_0.upgrade_log"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "IP Update Log" -objects $file_obj

set file "TySOM_2_7Z100_clk_wiz_0_1/TySOM_2_7Z100_clk_wiz_0_1.upgrade_log"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "IP Update Log" -objects $file_obj

set file "TySOM_2_7Z100_clk_wiz_0_2/TySOM_2_7Z100_clk_wiz_0_2.upgrade_log"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "IP Update Log" -objects $file_obj

set file "TySOM_2_7Z100_clk_wiz_0_3/TySOM_2_7Z100_clk_wiz_0_3.upgrade_log"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "IP Update Log" -objects $file_obj

set file "TySOM_2_7Z100_clk_wiz_0_4/TySOM_2_7Z100_clk_wiz_0_4.upgrade_log"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "IP Update Log" -objects $file_obj

set file "TySOM_2_7Z100_clk_wiz_0_5/TySOM_2_7Z100_clk_wiz_0_5.upgrade_log"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "IP Update Log" -objects $file_obj

set file "TySOM_2_7Z100_ov10635_decoder_core_0_0/TySOM_2_7Z100_ov10635_decoder_core_0_0.upgrade_log"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "IP Update Log" -objects $file_obj

set file "TySOM_2_7Z100_ov10635_decoder_core_1_1/TySOM_2_7Z100_ov10635_decoder_core_1_1.upgrade_log"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "IP Update Log" -objects $file_obj

set file "TySOM_2_7Z100_ov10635_decoder_core_2_0/TySOM_2_7Z100_ov10635_decoder_core_2_0.upgrade_log"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "IP Update Log" -objects $file_obj

set file "TySOM_2_7Z100_ov10635_decoder_core_3_0/TySOM_2_7Z100_ov10635_decoder_core_3_0.upgrade_log"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "IP Update Log" -objects $file_obj

set file "TySOM_2_7Z100_ov10635_decoder_core_4_0/TySOM_2_7Z100_ov10635_decoder_core_4_0.upgrade_log"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "IP Update Log" -objects $file_obj

set file "TySOM_2_7Z100_proc_sys_reset_0_0/TySOM_2_7Z100_proc_sys_reset_0_0.upgrade_log"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "IP Update Log" -objects $file_obj

set file "TySOM_2_7Z100_proc_sys_reset_0_1/TySOM_2_7Z100_proc_sys_reset_0_1.upgrade_log"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "IP Update Log" -objects $file_obj

set file "TySOM_2_7Z100_proc_sys_reset_0_2/TySOM_2_7Z100_proc_sys_reset_0_2.upgrade_log"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "IP Update Log" -objects $file_obj

set file "TySOM_2_7Z100_proc_sys_reset_0_3/TySOM_2_7Z100_proc_sys_reset_0_3.upgrade_log"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "IP Update Log" -objects $file_obj

set file "TySOM_2_7Z100_proc_sys_reset_0_4/TySOM_2_7Z100_proc_sys_reset_0_4.upgrade_log"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "IP Update Log" -objects $file_obj

set file "TySOM_2_7Z100_proc_sys_reset_0_5/TySOM_2_7Z100_proc_sys_reset_0_5.upgrade_log"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "IP Update Log" -objects $file_obj

set file "TySOM_2_7Z100_proc_sys_reset_0_6/TySOM_2_7Z100_proc_sys_reset_0_6.upgrade_log"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "IP Update Log" -objects $file_obj

set file "TySOM_2_7Z100_proc_sys_reset_0_7/TySOM_2_7Z100_proc_sys_reset_0_7.upgrade_log"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "IP Update Log" -objects $file_obj

set file "TySOM_2_7Z100_proc_sys_reset_1_0/TySOM_2_7Z100_proc_sys_reset_1_0.upgrade_log"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "IP Update Log" -objects $file_obj

set file "TySOM_2_7Z100_processing_system7_0_0/TySOM_2_7Z100_processing_system7_0_0.upgrade_log"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "IP Update Log" -objects $file_obj

set file "TySOM_2_7Z100_util_ds_buf_0_0/TySOM_2_7Z100_util_ds_buf_0_0.upgrade_log"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "IP Update Log" -objects $file_obj

set file "TySOM_2_7Z100_util_ds_buf_1_0/TySOM_2_7Z100_util_ds_buf_1_0.upgrade_log"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "IP Update Log" -objects $file_obj

set file "TySOM_2_7Z100_util_ds_buf_2_0/TySOM_2_7Z100_util_ds_buf_2_0.upgrade_log"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "IP Update Log" -objects $file_obj

set file "TySOM_2_7Z100_util_ds_buf_3_0/TySOM_2_7Z100_util_ds_buf_3_0.upgrade_log"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "IP Update Log" -objects $file_obj

set file "TySOM_2_7Z100_util_ds_buf_4_0/TySOM_2_7Z100_util_ds_buf_4_0.upgrade_log"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "IP Update Log" -objects $file_obj

set file "TySOM_2_7Z100_v_axi4s_vid_out_0_0/TySOM_2_7Z100_v_axi4s_vid_out_0_0.upgrade_log"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "IP Update Log" -objects $file_obj

set file "TySOM_2_7Z100_v_cresample_0_0/TySOM_2_7Z100_v_cresample_0_0.upgrade_log"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "IP Update Log" -objects $file_obj

set file "TySOM_2_7Z100_v_osd_0_0/TySOM_2_7Z100_v_osd_0_0.upgrade_log"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "IP Update Log" -objects $file_obj

set file "TySOM_2_7Z100_v_rgb2ycrcb_0_0/TySOM_2_7Z100_v_rgb2ycrcb_0_0.upgrade_log"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "IP Update Log" -objects $file_obj

set file "TySOM_2_7Z100_v_tc_0_0/TySOM_2_7Z100_v_tc_0_0.upgrade_log"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "IP Update Log" -objects $file_obj

set file "TySOM_2_7Z100_v_vid_in_axi4s_0_0/TySOM_2_7Z100_v_vid_in_axi4s_0_0.upgrade_log"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "IP Update Log" -objects $file_obj

set file "TySOM_2_7Z100_v_vid_in_axi4s_0_1/TySOM_2_7Z100_v_vid_in_axi4s_0_1.upgrade_log"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "IP Update Log" -objects $file_obj

set file "TySOM_2_7Z100_v_vid_in_axi4s_0_2/TySOM_2_7Z100_v_vid_in_axi4s_0_2.upgrade_log"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "IP Update Log" -objects $file_obj

set file "TySOM_2_7Z100_v_vid_in_axi4s_0_3/TySOM_2_7Z100_v_vid_in_axi4s_0_3.upgrade_log"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "IP Update Log" -objects $file_obj

set file "TySOM_2_7Z100_v_vid_in_axi4s_0_4/TySOM_2_7Z100_v_vid_in_axi4s_0_4.upgrade_log"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "IP Update Log" -objects $file_obj

set file "TySOM_2_7Z100_xlconcat_0_0/TySOM_2_7Z100_xlconcat_0_0.upgrade_log"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "IP Update Log" -objects $file_obj

set file "TySOM_2_7Z100_xlconstant_0_0/TySOM_2_7Z100_xlconstant_0_0.upgrade_log"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "IP Update Log" -objects $file_obj

set file "TySOM_2_7Z100_xlconstant_0_1/TySOM_2_7Z100_xlconstant_0_1.upgrade_log"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "IP Update Log" -objects $file_obj

set file "TySOM_2_7Z100_xlslice_0_4/TySOM_2_7Z100_xlslice_0_4.upgrade_log"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "IP Update Log" -objects $file_obj

set file "TySOM_2_7Z100_xlslice_0_5/TySOM_2_7Z100_xlslice_0_5.upgrade_log"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "IP Update Log" -objects $file_obj

set file "TySOM_2_7Z100_xlslice_0_6/TySOM_2_7Z100_xlslice_0_6.upgrade_log"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "IP Update Log" -objects $file_obj

set file "TySOM_2_7Z100_xlslice_0_7/TySOM_2_7Z100_xlslice_0_7.upgrade_log"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "IP Update Log" -objects $file_obj

set file "TySOM_2_7Z100_xlslice_0_8/TySOM_2_7Z100_xlslice_0_8.upgrade_log"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "IP Update Log" -objects $file_obj


# Set 'sources_1' fileset properties
set obj [get_filesets sources_1]
set_property -name "top" -value "TySOM_2_7Z100_wrapper" -objects $obj

# Create 'constrs_1' fileset (if not found)
if {[string equal [get_filesets -quiet constrs_1] ""]} {
  create_fileset -constrset constrs_1
}

# Set 'constrs_1' fileset object
set obj [get_filesets constrs_1]

# Add/Import constrs file and set constrs file properties
set file "[file normalize "$origin_dir/constrs_1/new/constr.xdc"]"
set file_imported [import_files -fileset constrs_1 $file]
set file "new/constr.xdc"
set file_obj [get_files -of_objects [get_filesets constrs_1] [list "*$file"]]
set_property -name "file_type" -value "XDC" -objects $file_obj

# Set 'constrs_1' fileset properties
set obj [get_filesets constrs_1]

# Create 'sim_1' fileset (if not found)
if {[string equal [get_filesets -quiet sim_1] ""]} {
  create_fileset -simset sim_1
}

# Set 'sim_1' fileset object
set obj [get_filesets sim_1]
# Empty (no sources present)

# Set 'sim_1' fileset properties
set obj [get_filesets sim_1]
set_property -name "top" -value "TySOM_2_7Z100_wrapper" -objects $obj

# Create 'synth_1' run (if not found)
if {[string equal [get_runs -quiet synth_1] ""]} {
  create_run -name synth_1 -part xc7z100ffg900-2 -flow {Vivado Synthesis 2015} -strategy "Vivado Synthesis Defaults" -constrset constrs_1
} else {
  set_property strategy "Vivado Synthesis Defaults" [get_runs synth_1]
  set_property flow "Vivado Synthesis 2015" [get_runs synth_1]
}
set obj [get_runs synth_1]
set_property -name "part" -value "xc7z100ffg900-2" -objects $obj

# set the current synth run
current_run -synthesis [get_runs synth_1]

# Create 'impl_1' run (if not found)
if {[string equal [get_runs -quiet impl_1] ""]} {
  create_run -name impl_1 -part xc7z100ffg900-2 -flow {Vivado Implementation 2015} -strategy "Vivado Implementation Defaults" -constrset constrs_1 -parent_run synth_1
} else {
  set_property strategy "Vivado Implementation Defaults" [get_runs impl_1]
  set_property flow "Vivado Implementation 2015" [get_runs impl_1]
}
set obj [get_runs impl_1]
set_property -name "part" -value "xc7z100ffg900-2" -objects $obj
set_property -name "steps.write_bitstream.args.readback_file" -value "0" -objects $obj
set_property -name "steps.write_bitstream.args.verbose" -value "0" -objects $obj

# set the current impl run
current_run -implementation [get_runs impl_1]

puts "INFO: Project created:TySOM_2_7Z100"
