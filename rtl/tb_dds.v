`timescale	1ns/1ps

module	tb_dds();

reg 	sclk;
reg		rst_n;

wire	[15:0]	data_out;

//---------系统时钟----------//
initial	sclk = 1;
always	#10	sclk = !sclk;
//---------复位---------//
initial	begin
	rst_n = 0;
	#100
	rst_n = 1;
end

//-----------------------//
mixer		mixer_inst(
    .sys_clk			(sclk),
    .sys_rst_n			(rst_n),
    .data_out			(data_out)
);
//-----------------------//

endmodule

