/************************************************************************
Avalon-MM Interface for Neural Network
************************************************************************/

module avalon_nn_interface (
	// Avalon Clock Input
	input logic CLK,
	
	// Avalon Reset Input
	input logic RESET,
	
	// Avalon-MM Slave Signals
	input  logic AVL_READ,					// Avalon-MM Read
	input  logic AVL_WRITE,					// Avalon-MM Write
	input  logic AVL_CS,						// Avalon-MM Chip Select
	input  logic [3:0] AVL_BYTE_EN,		// Avalon-MM Byte Enable
	input  logic [4:0] AVL_ADDR,			// Avalon-MM Address
	input  logic [31:0] AVL_WRITEDATA,	// Avalon-MM Write Data
	output logic [31:0] AVL_READDATA,	// Avalon-MM Read Data
	output logic [31:0] EXPORT_DATA
);

logic [31:0] data [32] /* synthesis ramstyle = "logic" */;
logic [31:0] _dataout;
assign AVL_READDATA = data[AVL_ADDR];


// expanded mem_byte_en and write data
logic [31:0] write_mask;
logic [31:0] write_data;
assign write_mask = { {8{AVL_BYTE_EN[3]}}, {8{AVL_BYTE_EN[2]}}, {8{AVL_BYTE_EN[1]}}, {8{AVL_BYTE_EN[0]}} };
assign write_data = (write_mask & AVL_WRITEDATA) | ((~write_mask) & data[AVL_ADDR]);

logic [31:0] O_1, O_2;
logic [31:0] correct, incorrect;
logic both_pos, both_neg;

always_comb
begin
	both_pos = ~(O_1[31] | O_2[31]) & ((O_1[30:23] > O_2[30:23]) | ((O_1[30:23] == O_2[30:23]) & (O_1[22:0] > O_2[22:0])));
	both_neg = O_1[31] & O_2[31] & ((O_1[30:23] < O_2[30:23]) | ((O_1[30:23] == O_2[30:23]) & (O_1[22:0] < O_2[22:0])));

	if ((O_1[31] > O_2[31]) | both_pos | both_neg) begin
		correct = O_1;
		incorrect = O_2;
	end
	else begin
		correct = O_2;
		incorrect = O_1;
	end
end

neural_net nn (
	.X_1(data[0]), .X_2(data[1]), .X_3(data[2]), .X_4(data[3]),
	.X_5(data[4]), .X_6(data[5]), .X_7(data[6]), .X_8(data[7]),
	.X_9(data[8]), .X_10(data[9]), .X_11(data[10]), .X_12(data[11]),
	.X_13(data[12]), .X_14(data[13]), .X_15(data[14]), .X_16(data[15]),
	.*
);

Float_Add class_diff (
	.a(correct),
	.b({~(incorrect[31]), incorrect[30:0]}),
	.c(EXPORT_DATA)
);


always_ff @(posedge CLK)
begin
    if (RESET) begin
        for (int i = 0; i < 32; ++i)
            data[i] <= '0;
    end
    else begin
        // if (AVL_READ)
        //     _dataout <= AVL_WRITE ? write_data : data[AVL_ADDR];

        if(AVL_WRITE) begin
			data[AVL_ADDR] <= write_data;
		end
        else begin
			data[16] <= O_1;
			data[17] <= O_2;
		end
    end
end

endmodule : avalon_nn_interface
