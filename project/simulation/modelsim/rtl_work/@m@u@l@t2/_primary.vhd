library verilog;
use verilog.vl_types.all;
entity MULT2 is
    port(
        dataa           : in     vl_logic_vector(31 downto 0);
        datab           : in     vl_logic_vector(15 downto 0);
        result          : out    vl_logic_vector(47 downto 0)
    );
end MULT2;
