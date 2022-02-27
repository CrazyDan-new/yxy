library verilog;
use verilog.vl_types.all;
entity audio_rcv is
    port(
        audio_bclk      : in     vl_logic;
        sys_rst_n       : in     vl_logic;
        audio_lrc       : in     vl_logic;
        audio_adcdat    : in     vl_logic;
        adc_data        : out    vl_logic_vector(15 downto 0);
        rcv_done        : out    vl_logic
    );
end audio_rcv;
