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
	input  logic [3:0] AVL_ADDR,			// Avalon-MM Address
	input  logic [31:0] AVL_WRITEDATA,	// Avalon-MM Write Data
	output logic [31:0] AVL_READDATA	// Avalon-MM Read Data
);

logic [31:0] data [72] /* synthesis ramstyle = "logic" */;
logic [31:0] _dataout;
assign AVL_READDATA = data[AVL_ADDR];


// expanded mem_byte_en and write data
logic [31:0] write_mask;
logic [31:0] write_data;
assign write_mask = { {8{AVL_BYTE_EN[3]}}, {8{AVL_BYTE_EN[2]}}, {8{AVL_BYTE_EN[1]}}, {8{AVL_BYTE_EN[0]}} };
assign write_data = (write_mask & AVL_WRITEDATA) | ((~write_mask) & data[AVL_ADDR]);

logic [31:0] O_1, O_2, O_3, O_4, O_5, O_6, O_7, O_8;


neural_net nn (
	.X_1(data[0]), .X_2(data[1]), .X_3(data[2]), .X_4(data[3]),
	.X_5(data[4]), .X_6(data[5]), .X_7(data[6]), .X_8(data[7]),
	.X_9(data[8]), .X_10(data[9]), .X_11(data[10]), .X_12(data[11]),
	.X_13(data[12]), .X_14(data[13]), .X_15(data[14]), .X_16(data[15]),
	.X_17(data[16]), .X_18(data[17]), .X_19(data[18]), .X_20(data[19]),
	.X_21(data[20]), .X_22(data[21]), .X_23(data[22]), .X_24(data[23]),
	.X_25(data[24]), .X_26(data[25]), .X_27(data[26]), .X_28(data[27]),
	.X_29(data[28]), .X_30(data[29]), .X_31(data[30]), .X_32(data[31]),
	.X_33(data[32]), .X_34(data[33]), .X_35(data[34]), .X_36(data[35]),
	.X_37(data[36]), .X_38(data[37]), .X_39(data[38]), .X_40(data[39]),
	.X_41(data[40]), .X_42(data[41]), .X_43(data[42]), .X_44(data[43]),
	.X_45(data[44]), .X_46(data[45]), .X_47(data[46]), .X_48(data[47]),
	.X_49(data[48]), .X_50(data[49]), .X_51(data[50]), .X_52(data[51]),
	.X_53(data[52]), .X_54(data[53]), .X_55(data[54]), .X_56(data[55]),
	.X_57(data[56]), .X_58(data[57]), .X_59(data[58]), .X_60(data[59]),
	.X_61(data[60]), .X_62(data[61]), .X_63(data[62]), .X_64(data[63]),
	.*
);


always_ff @(posedge CLK)
begin
    if (RESET) begin
        for (int i = 0; i < 16; ++i)
            data[i] <= '0;
    end
    else begin
        // if (AVL_READ)
        //     _dataout <= AVL_WRITE ? write_data : data[AVL_ADDR];

        if(AVL_WRITE) begin
			data[AVL_ADDR] <= write_data;
		end
        else begin
			data[64] <= O_1;
			data[65] <= O_2;
			data[66] <= O_3;
			data[67] <= O_4;
			data[68] <= O_5;
			data[69] <= O_6;
			data[70] <= O_7;
			data[71] <= O_8;
		end
    end
end

endmodule : avalon_nn_interface
