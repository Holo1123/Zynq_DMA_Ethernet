# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct C:\Users\a\Desktop\GPS_work\Ethernet_test\platform.tcl
# 
# OR launch xsct and run below command.
# source C:\Users\a\Desktop\GPS_work\Ethernet_test\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {Ethernet_test}\
-hw {D:\GPS\GPS_fmc\zynq_dev_fmcomms3\DMA_to_Ethernet_PS\Ethernet_test.xsa}\
-out {C:/Users/a/Desktop/GPS_work}

platform write
domain create -name {freertos10_xilinx_ps7_cortexa9_0} -display-name {freertos10_xilinx_ps7_cortexa9_0} -os {freertos10_xilinx} -proc {ps7_cortexa9_0} -runtime {cpp} -arch {32-bit} -support-app {freertos_lwip_udp_perf_server}
platform generate -domains 
platform active {Ethernet_test}
domain active {zynq_fsbl}
domain active {freertos10_xilinx_ps7_cortexa9_0}
platform generate -quick
platform generate
