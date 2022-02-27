module mixer(
	input sys_clk              ,
	input sys_rst_n            ,
	input audio_bclk           ,
	input audio_lrc            ,
	input audio_adcdat		   ,			   
							   
							   
	output scl                 ,
	output audio_mclk          ,
	inout  sda                 ,
	output [7:0]data_out
);
wire signed [31:0] data_out1;
wire signed [15:0] zaibo;
wire signed [15:0] FM_data;	
wire signed [47:0]	q;

dds_make dds_make_inst
(
    .sys_clk(sys_clk)     	,   //系统时钟,50MHz
    .sys_rst_n(sys_rst_n)   ,   //复位信号,低电平有效
	
	.sin(zaibo)
);

 MULT1 MULT1_inst 
 (
	.dataa(FM_data)	,
	.datab(zaibo)	,
	.result(data_out1)
);

 MULT2 MULT2_inst 
 (
	.dataa(data_out1),
	.datab(zaibo)	,
	.result(q)
);


FM_top FM_top_inst(
    .clk			(sys_clk)		 	,
	.rst_n          (sys_rst_n)      	,
	.audio_bclk     (audio_bclk)      	,
    .audio_lrc      (audio_lrc)      	, 
	.audio_adcdat   (audio_adcdat)      ,

	               
	.scl            (scl)      			,
	.audio_mclk     (audio_mclk)      	,
    .FM_Mod_data  	(FM_data)	 	,
	.sda            (sda)      			
);
fifo_48to8 fifo_48to8_inst(
	.clock(sys_clk),
    .data(q),
	.rdreq(),
    .wrreq(),
    .empty(),
    .q(data_out)
);
endmodule