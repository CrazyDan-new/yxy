library verilog;
use verilog.vl_types.all;
entity wm8978_cfg is
    port(
        sys_clk         : in     vl_logic;
        sys_rst_n       : in     vl_logic;
        i2c_scl         : out    vl_logic;
        i2c_sda         : inout  vl_logic
    );
end wm8978_cfg;
