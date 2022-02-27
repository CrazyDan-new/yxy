library verilog;
use verilog.vl_types.all;
entity i2c_reg_cfg is
    generic(
        REG_NUM         : vl_logic_vector(0 to 5) := (Hi0, Hi1, Hi0, Hi0, Hi1, Hi0);
        CNT_WAIT_MAX    : vl_logic_vector(0 to 9) := (Hi1, Hi1, Hi1, Hi1, Hi1, Hi0, Hi1, Hi0, Hi0, Hi0);
        LOUT1VOL        : vl_logic_vector(0 to 5) := (Hi1, Hi0, Hi1, Hi0, Hi0, Hi0);
        ROUT1VOL        : vl_logic_vector(0 to 5) := (Hi1, Hi0, Hi1, Hi0, Hi0, Hi0);
        SPK_LOUT2VOL    : vl_logic_vector(0 to 5) := (Hi1, Hi0, Hi1, Hi1, Hi0, Hi1);
        SPK_ROUT2VOL    : vl_logic_vector(0 to 5) := (Hi1, Hi0, Hi1, Hi1, Hi0, Hi1)
    );
    port(
        i2c_clk         : in     vl_logic;
        sys_rst_n       : in     vl_logic;
        cfg_end         : in     vl_logic;
        cfg_start       : out    vl_logic;
        cfg_data        : out    vl_logic_vector(15 downto 0);
        cfg_done        : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of REG_NUM : constant is 1;
    attribute mti_svvh_generic_type of CNT_WAIT_MAX : constant is 1;
    attribute mti_svvh_generic_type of LOUT1VOL : constant is 1;
    attribute mti_svvh_generic_type of ROUT1VOL : constant is 1;
    attribute mti_svvh_generic_type of SPK_LOUT2VOL : constant is 1;
    attribute mti_svvh_generic_type of SPK_ROUT2VOL : constant is 1;
end i2c_reg_cfg;
