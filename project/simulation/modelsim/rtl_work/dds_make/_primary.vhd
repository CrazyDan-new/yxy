library verilog;
use verilog.vl_types.all;
entity dds_make is
    generic(
        freq            : integer := 412316860
    );
    port(
        sys_clk         : in     vl_logic;
        sys_rst_n       : in     vl_logic;
        sin             : out    vl_logic_vector(15 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of freq : constant is 1;
end dds_make;
