`timescale  1ns/1ns


module  dds_make
(
    input   wire            sys_clk     ,   //系统时钟,50MHz
    input   wire            sys_rst_n   ,   //复位信号,低电平有效

	output	wire	        [15:0] sin
);

//parameter define

wire clk0;
wire   rst;
parameter freq = 32'd412316860;
//reg   define
reg     [31:0] fre_add     ;   //相位累加器
reg     [9:0]  rom_addr_reg;   //相位调制后的相位码
reg     [9:0]  rom_addr    ;   //ROM读地址

assign rst=~sys_rst_n;
 

//********************************************************************//
//***************************** Main Code ****************************//
//********************************************************************//
//fre_add:相位累加器
always@(posedge clk0 or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        begin
        fre_add  <=  32'd0;
        end
    else
        begin
        fre_add  <=  fre_add  + freq;
        end

//rom_addr:ROM读地址
always@(posedge clk0 or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        begin
            rom_addr        <=  10'd0;
            rom_addr_reg    <=  10'd0;
        end
    else
        begin
                rom_addr_reg    <=  fre_add[31:22];
                rom_addr        <=  rom_addr_reg;
        end     //正弦波
            
            

       
//********************************************************************//
//*************************** Instantiation **************************//
//********************************************************************//
//------------------------- rom_wave_inst ------------------------

pll pll_inst(
	.areset(rst),
	.inclk0(sys_clk),
	.c0(clk0),
	.locked()
	);


sin				sin_inst0(
  	.clock		(clk0),
  	.address	(rom_addr),
  	.q		    (sin)
);


endmodule