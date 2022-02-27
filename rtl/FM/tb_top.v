`timescale	1ns/1ps

module	tb_top();

reg 	sclk;
reg		rst_n;

wire	[15:0]	FM_Mod_data;

//---------系统时钟----------//
initial	sclk = 1;
always	#5	sclk = !sclk;
//---------复位---------//
initial	begin
	rst_n = 0;
	#100
	rst_n = 1;
end

//-----------------------//
TOP					TOP_inst(
    .clk			(sclk),
    .rst_n			(rst_n),
    .FM_Mod_data	(FM_Mod_data)
);
//-----------------------//

endmodule

