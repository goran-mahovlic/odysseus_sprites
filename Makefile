# ******* project, board and chip name *******
PROJECT = CSI
BOARD = ulx3s
# 12 25 45 85
FPGA_SIZE = 12
FPGA_PACKAGE = CABGA381

# ******* if programming with OpenOCD *******
# using local latest openocd until in linux distribution
#OPENOCD=openocd_ft232r
# default onboard usb-jtag
OPENOCD_INTERFACE=$(SCRIPTS)/ft231x.ocd
# ulx3s-jtag-passthru
#OPENOCD_INTERFACE=$(SCRIPTS)/ft231x2.ocd
# ulx2s
#OPENOCD_INTERFACE=$(SCRIPTS)/ft232r.ocd
# external jtag
#OPENOCD_INTERFACE=$(SCRIPTS)/ft2232.ocd

# ******* design files *******
CONSTRAINTS = ulx3s_v20.lpf
#TOP_MODULE = top
#TOP_MODULE_FILE = top/$(TOP_MODULE).v
TOP_MODULE = top
TOP_MODULE_FILE = top/$(TOP_MODULE).v

VERILOG_FILES = \
  $(TOP_MODULE_FILE) \
  src/ecp5pll.sv \
  src/sprite_rom.v \
  src/clk_25_250_125_25.v \
  src/fake_differential.v \
  src/hdmi_video.v \
  src/pll.v \
  src/tmds_encoder.v \
  src/vga2dvid.v \
  src/vga_video.v

# *.vhd those files will be converted to *.v files with vhdl2vl (warning overwriting/deleting)
VHDL_FILES = \
#  hdl/vga.vhd \
#  hdl/vga2dvid.vhd \
#  hdl/tmds_encoder.vhd

# synthesis options
#YOSYS_OPTIONS = -noccu2
NEXTPNR_OPTIONS = --timing-allow-fail --speed 7

SCRIPTS = scripts
include $(SCRIPTS)/diamond_path.mk
include $(SCRIPTS)/trellis_path.mk
include $(SCRIPTS)/trellis_main.mk
