#
# This file was created by Xilinx Vitis tool.
#


#
# tools
#

RM = rm -f
RMDIR = rm -rf



#
# variables
#

SDCARD_GEN = sdcard_gen
GENERATE_BIF = ::scw::generate_bif

XPFM_PATH = C:/Users/a/Desktop/GPS_work/Ethernet_test/export/Ethernet_test/Ethernet_test.xpfm
SYS_CONFIG = Ethernet_test
DOMAINS = freertos10_xilinx_ps7_cortexa9_0
BIF_PATH = C:/Users/a/Desktop/GPS_work/DMA_2_ethernet_test_system/Debug/system.bif

BITSTREAM_PATH = C:/Users/a/Desktop/GPS_work/DMA_2_ethernet_test/_ide/bitstream/Ethernet_test.bit
SD_FILES = --elf C:/Users/a/Desktop/GPS_work/DMA_2_ethernet_test/Debug/DMA_2_ethernet_test.elf,ps7_cortexa9_0

#
# primary build targets
#

package:
	-@echo Generating bif file for the system project
	generate_system_bif.bat 65363 ${XPFM_PATH} ${DOMAINS} ${BIF_PATH}
	${SDCARD_GEN} --xpfm ${XPFM_PATH} --sys_config ${SYS_CONFIG} --bif ${BIF_PATH} --bitstream ${BITSTREAM_PATH} ${SD_FILES}

clean:
	$(RMDIR) ./_sds
	${RMDIR} package
	${RM} system.bif

.PHONY: all package clean

all: package


