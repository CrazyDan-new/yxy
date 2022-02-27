module FM_top(
    input			clk					 ,
	input			rst_n                ,
	input			audio_bclk           ,
    input           audio_lrc            ,
	input           audio_adcdat         ,

	output 			scl                  ,
	output          audio_mclk           ,
    output  [15:0]  FM_Mod_data  		 ,
	inout  	wire    sda                  
);


wire [15:0] adc_data;
//----------------ADC-----------------//;

audio_loopback audio_loopback_inst
(
    .sys_clk        (clk),   //系统时钟，频率50MHz
    .sys_rst_n      (rst_n),   //系统复位，低电平有效
    .audio_bclk     (audio_bclk),   //WM8978输出的位时钟
    .audio_lrc      (audio_lrc),   //WM8978输出的数据左/右对齐时钟
    .audio_adcdat   (audio_adcdat),   //WM8978ADC数据输出

    .scl            (scl),   //输出至wm8978的串行时钟信号scl
    .audio_mclk     (audio_mclk),   //输出WM8978主时钟,频率12MHz
    .adc_data    	(adc_data),   //输出DAC数据给WM8978
    .sda            (sda)    //输出至wm8978的串行数据信号sda

);
//------------------------------------//

//---------------FM调制----------------//
FM_Mod          FM_Mod_inst(
	.clk        (clk),
	.rst_n      (rst_n),
	.adc_data   (adc_data),
	.FM_Mod     (FM_Mod_data)
);


endmodule

