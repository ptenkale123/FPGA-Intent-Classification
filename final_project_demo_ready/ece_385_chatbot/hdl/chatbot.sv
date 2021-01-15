/************************************************************************
Chatbot Quartus Project Top Level
************************************************************************/

module chatbot (
	input  logic        CLOCK_50,
	input  logic [1:0]  KEY,
	input  logic [9:0]  SW,
	output logic [7:0]  LED,
	output logic [6:0]  HEX0,
	output logic [6:0]  HEX1,
	output logic [6:0]  HEX2,
	output logic [6:0]  HEX3,
	output logic [6:0]  HEX4,
	output logic [6:0]  HEX5,
	output logic        VGA_HS,
	output logic        VGA_VS,
	output logic [3:0]  VGA_R,
	output logic [3:0]  VGA_G,
	output logic [3:0]  VGA_B,

	output logic [12:0] DRAM_ADDR,
	output logic [1:0]  DRAM_BA,
	output logic        DRAM_CAS_N,
	output logic        DRAM_CKE,
	output logic        DRAM_CS_N,
	inout  logic [15:0] DRAM_DQ,
	output logic [1:0]  DRAM_DQM,
	output logic        DRAM_RAS_N,
	output logic        DRAM_WE_N,
	output logic        DRAM_CLK
);

logic [31:0] CLASS_DIFF;

logic Reset_h, blank, sync, VGA_Clk;

logic [7:0] Red, Blue, Green;

assign Reset_h = ~(KEY[0]);

//Our A/D converter is only 12 bit
assign VGA_R = Red[7:4];
assign VGA_B = Blue[7:4];
assign VGA_G = Green[7:4];


// Instantiation of Qsys design
chatbot_soc chatbot_qsystem (
	.clk_clk(CLOCK_50),								// Clock input
	.nn_export_export_data(CLASS_DIFF), 			// Exported Data from NN
	.reset_reset_n(KEY[0]),							// Reset key
	.sdram_wire_addr(DRAM_ADDR),					// sdram_wire.addr
	.sdram_wire_ba(DRAM_BA),						// sdram_wire.ba
	.sdram_wire_cas_n(DRAM_CAS_N),				// sdram_wire.cas_n
	.sdram_wire_cke(DRAM_CKE),						// sdram_wire.cke
	.sdram_wire_cs_n(DRAM_CS_N),					// sdram.cs_n
	.sdram_wire_dq(DRAM_DQ),						// sdram.dq
	.sdram_wire_dqm(DRAM_DQM),						// sdram.dqm
	.sdram_wire_ras_n(DRAM_RAS_N),				// sdram.ras_n
	.sdram_wire_we_n(DRAM_WE_N),					// sdram.we_n
	.sdram_clk_clk(DRAM_CLK)						// Clock out to SDRAM
);

vga_controller vga_controller_0 (
	.Clk(CLOCK_50),
	.Reset(Reset_h),
	.hs(VGA_HS),
	.vs(VGA_VS),
	.pixel_clk(VGA_Clk),
	.blank(blank),
	.sync(sync)
);

color_mapper color_mapper_0 (
	.CLASS_DIFF(CLASS_DIFF),
	.blank(blank),
	.Red(Red),
	.Green(Green),
	.Blue(Blue)
);




endmodule : chatbot