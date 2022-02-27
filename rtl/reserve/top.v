module top
(
	input 			sys_clk,
	input 			sys_rst_n,
	input signed [15:0] FM_data,
	output signed [65:0] filter_out
	
);
wire signed [47:0] data_out;

mixer mixer_inst(
	.FM_data(FM_data),
	.sys_clk(sys_clk),
	.sys_rst_n(sys_rst_n),

	.data_out(data_out)
);

filter filter_inst(
    .clk(sys_clk),
    .clk_enable(sys_rst_n),
    .reset(),
    .filter_in(data_out),
    .filter_out(filter_out)
);

endmodule