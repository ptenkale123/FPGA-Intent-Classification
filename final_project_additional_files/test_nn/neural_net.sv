module neural_net (
    input logic [31:0] X_1, X_2, X_3, X_4, X_5, X_6, X_7, X_8, X_9, X_10,
    X_11, X_12, X_13, X_14, X_15, X_16,

    output logic [31:0] O_1, O_2
);

nn_partition p_1 (.*,
.W_1(32'hbe767a10), .W_2(32'h3ea0ded3), .W_3(32'h3ec17c1c), .W_4(32'h3b09a027), 
.W_5(32'hbd6a4a8c), .W_6(32'h3cfd21ff), .W_7(32'h3df6fd22), .W_8(32'hbdd63886), 
.W_9(32'hbdc9ba5e), .W_10(32'hbd315b57), .W_11(32'hbe829c78), .W_12(32'hbe23a29c), 
.W_13(32'h3e33eab3), .W_14(32'hbd371759), .W_15(32'hbe409d49), .W_16(32'h3e0bfb16), 
.bias(32'h3e67d567), .out(O_1));

nn_partition p_2 (.*,
.W_1(32'hbd0e2196), .W_2(32'hbdf4bc6a), .W_3(32'hbddc5d64), .W_4(32'h3e189375), 
.W_5(32'h3da4a8c1), .W_6(32'h3c04b5dd), .W_7(32'h3d9eb852), .W_8(32'h3c102de0), 
.W_9(32'h3ecd4fdf), .W_10(32'h3e62680a), .W_11(32'hbe0a233a), .W_12(32'hbe0a233a), 
.W_13(32'h3da0f909), .W_14(32'hbdbfb15b), .W_15(32'h3e9c1bda), .W_16(32'hbdc95183), 
.bias(32'h3dce3bcd), .out(O_2));

endmodule : neural_net