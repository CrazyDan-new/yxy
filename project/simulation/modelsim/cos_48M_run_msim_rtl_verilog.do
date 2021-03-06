transcript on
if ![file isdirectory verilog_libs] {
	file mkdir verilog_libs
}

vlib verilog_libs/altera_ver
vmap altera_ver ./verilog_libs/altera_ver
vlog -vlog01compat -work altera_ver {d:/intelfpga_lite/quartus/eda/sim_lib/altera_primitives.v}

vlib verilog_libs/lpm_ver
vmap lpm_ver ./verilog_libs/lpm_ver
vlog -vlog01compat -work lpm_ver {d:/intelfpga_lite/quartus/eda/sim_lib/220model.v}

vlib verilog_libs/sgate_ver
vmap sgate_ver ./verilog_libs/sgate_ver
vlog -vlog01compat -work sgate_ver {d:/intelfpga_lite/quartus/eda/sim_lib/sgate.v}

vlib verilog_libs/altera_mf_ver
vmap altera_mf_ver ./verilog_libs/altera_mf_ver
vlog -vlog01compat -work altera_mf_ver {d:/intelfpga_lite/quartus/eda/sim_lib/altera_mf.v}

vlib verilog_libs/altera_lnsim_ver
vmap altera_lnsim_ver ./verilog_libs/altera_lnsim_ver
vlog -sv -work altera_lnsim_ver {d:/intelfpga_lite/quartus/eda/sim_lib/altera_lnsim.sv}

vlib verilog_libs/cycloneive_ver
vmap cycloneive_ver ./verilog_libs/cycloneive_ver
vlog -vlog01compat -work cycloneive_ver {d:/intelfpga_lite/quartus/eda/sim_lib/cycloneive_atoms.v}

if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/FPGA_test/fifo_48to8/rtl {D:/FPGA_test/fifo_48to8/rtl/fifo.v}
vlog -vlog01compat -work work +incdir+D:/FPGA_test/cos_48M/rtl/audio {D:/FPGA_test/cos_48M/rtl/audio/wm8978_cfg.v}
vlog -vlog01compat -work work +incdir+D:/FPGA_test/cos_48M/rtl/audio {D:/FPGA_test/cos_48M/rtl/audio/i2c_reg_cfg.v}
vlog -vlog01compat -work work +incdir+D:/FPGA_test/cos_48M/rtl/audio {D:/FPGA_test/cos_48M/rtl/audio/i2c_ctrl.v}
vlog -vlog01compat -work work +incdir+D:/FPGA_test/cos_48M/rtl/audio {D:/FPGA_test/cos_48M/rtl/audio/audio_rcv.v}
vlog -vlog01compat -work work +incdir+D:/FPGA_test/cos_48M/rtl/audio {D:/FPGA_test/cos_48M/rtl/audio/audio_loopback.v}
vlog -vlog01compat -work work +incdir+D:/FPGA_test/cos_48M/rtl/mixer {D:/FPGA_test/cos_48M/rtl/mixer/mixer.v}
vlog -vlog01compat -work work +incdir+D:/FPGA_test/cos_48M/rtl/mixer {D:/FPGA_test/cos_48M/rtl/mixer/dds_make.v}
vlog -vlog01compat -work work +incdir+D:/FPGA_test/cos_48M/rtl/FM {D:/FPGA_test/cos_48M/rtl/FM/FM_top.v}
vlog -vlog01compat -work work +incdir+D:/FPGA_test/cos_48M/rtl/FM {D:/FPGA_test/cos_48M/rtl/FM/FM_Mod.v}
vlog -vlog01compat -work work +incdir+D:/FPGA_test/cos_48M/project/ip_core/ROM {D:/FPGA_test/cos_48M/project/ip_core/ROM/sin.v}
vlog -vlog01compat -work work +incdir+D:/FPGA_test/cos_48M/project/ip_core/PLL {D:/FPGA_test/cos_48M/project/ip_core/PLL/pll.v}
vlog -vlog01compat -work work +incdir+D:/FPGA_test/cos_48M/project/ip_core/MULT1 {D:/FPGA_test/cos_48M/project/ip_core/MULT1/MULT1.v}
vlog -vlog01compat -work work +incdir+D:/FPGA_test/cos_48M/project/ip_core/MULT2 {D:/FPGA_test/cos_48M/project/ip_core/MULT2/MULT2.v}
vlog -vlog01compat -work work +incdir+D:/FPGA_test/cos_48M/project/ip_core/FM_mult {D:/FPGA_test/cos_48M/project/ip_core/FM_mult/FM_mult.v}
vlog -vlog01compat -work work +incdir+D:/FPGA_test/cos_48M/project/ip_core {D:/FPGA_test/cos_48M/project/ip_core/clk_gen.v}
vlog -vlog01compat -work work +incdir+D:/FPGA_test/cos_48M/project/db {D:/FPGA_test/cos_48M/project/db/pll_altpll.v}
vlog -vlog01compat -work work +incdir+D:/FPGA_test/cos_48M/project/db {D:/FPGA_test/cos_48M/project/db/clk_gen_altpll.v}

vlog -vlog01compat -work work +incdir+D:/FPGA_test/cos_48M/project/../rtl {D:/FPGA_test/cos_48M/project/../rtl/tb_dds.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  tb_dds

add wave *
view structure
view signals
run -all
