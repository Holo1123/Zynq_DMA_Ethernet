connect -url tcp:127.0.0.1:3121
source C:/Users/Administrator/Desktop/zynq_dev_fmcomms3/zynq_dev_fmcomms3.sdk/ad9361_top_hw_platform_0/ps7_init.tcl
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent JTAG-SMT2 210251A08870"} -index 0
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent JTAG-SMT2 210251A08870" && level==0} -index 1
fpga -file C:/Users/Administrator/Desktop/zynq_dev_fmcomms3/zynq_dev_fmcomms3.sdk/ad9361_top_hw_platform_0/ad9361_top.bit
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent JTAG-SMT2 210251A08870"} -index 0
loadhw -hw C:/Users/Administrator/Desktop/zynq_dev_fmcomms3/zynq_dev_fmcomms3.sdk/ad9361_top_hw_platform_0/system.hdf -mem-ranges [list {0x40000000 0xbfffffff}]
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent JTAG-SMT2 210251A08870"} -index 0
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent JTAG-SMT2 210251A08870"} -index 0
dow C:/Users/Administrator/Desktop/zynq_dev_fmcomms3/zynq_dev_fmcomms3.sdk/ad9361/Debug/ad9361.elf
configparams force-mem-access 0
bpadd -addr &main
