library verilog;
use verilog.vl_types.all;
entity fifo_48to8 is
    port(
        clock           : in     vl_logic;
        data            : in     vl_logic_vector(47 downto 0);
        rdreq           : in     vl_logic;
        wrreq           : in     vl_logic;
        empty           : in     vl_logic;
        q               : out    vl_logic_vector(7 downto 0)
    );
end fifo_48to8;
