module FM_Mod(
	input	clk,
	input	rst_n,
	input	[15:0]	adc_data,
	output	[15:0]	FM_Mod
);

parameter Freq_I = 32'd214_748_365;		//载波信号的频率2.5M，时钟50M
parameter Freq_Word = 32'd3_221_225;	//频偏为75K
parameter cnt_width = 8'd32;

//-------------计算频偏控制字--------------//
wire	signed	[47:0]	mult_data;
wire	signed	[31:0]	Freq_Offset;

FM_mult		FM_mult_inst(
   	.dataa		(adc_data),
   	.datab		(Freq_Word),
   	.result		(mult_data)
);

assign	Freq_Offset = mult_data[43:16];	//移位

//---------------------------------------//
reg     [cnt_width-1:0]cnt_I;
wire    [9:0]   addr_I;
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)	begin
		cnt_I <= 0;
	end
	else	begin
	    cnt_I <= cnt_I + Freq_I + Freq_Offset;
	end
end

assign  addr_I = cnt_I[cnt_width-1:cnt_width-10];


//----------------ROM核-----------------//
sin				sin_inst(
  	.clock		(clk),
  	.address	(addr_I),
  	.q		    (FM_Mod)
);

endmodule

