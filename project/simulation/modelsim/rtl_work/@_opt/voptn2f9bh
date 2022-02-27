library verilog;
use verilog.vl_types.all;
entity FM_Mod is
    generic(
        Freq_I          : integer := 214748365;
        Freq_Word       : integer := 3221225;
        cnt_width       : vl_logic_vector(0 to 7) := (Hi0, Hi0, Hi1, Hi0, Hi0, Hi0, Hi0, Hi0)
    );
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        adc_data        : in     vl_logic_vector(15 downto 0);
        FM_Mod          : out    vl_logic_vector(15 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of Freq_I : constant is 1;
    attribute mti_svvh_generic_type of Freq_Word : constant is 1;
    attribute mti_svvh_generic_type of cnt_width : constant is 1;
end FM_Mod;
