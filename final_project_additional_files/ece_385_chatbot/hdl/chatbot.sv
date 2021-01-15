/************************************************************************
Chatbot Quartus Project Top Level
************************************************************************/

module chatbot (
	input  logic        CLOCK_50,
	input  logic [1:0]  KEY,
	output logic [7:0]  LED,
	output logic [6:0]  HEX0,
	output logic [6:0]  HEX1,
	output logic [6:0]  HEX2,
	output logic [6:0]  HEX3,
	output logic [6:0]  HEX4,
	output logic [6:0]  HEX5,

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


// Instantiation of Qsys design
chatbot_soc chatbot_qsystem (
	.clk_clk(CLOCK_50),								// Clock input
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




endmodule : chatbot