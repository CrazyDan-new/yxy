library verilog;
use verilog.vl_types.all;
entity audio_loopback is
    port(
        sys_clk         : in     vl_logic;
        sys_rst_n       : in     vl_logic;
        audio_bclk      : in     vl_logic;
        audio_lrc       : in     vl_logic;
        audio_adcdat    : in     vl_logic;
        scl             : out    vl_logic;
        audio_mclk      : out    vl_logic;
        adc_data        : out    vl_logic_vector(15 downto 0);
        sda             : inout  vl_logic
    );
end audio_loopback;
