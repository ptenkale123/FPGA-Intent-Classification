module nn_wrapper (
    input logic in,
    output logic out
);

logic [31:0] X_1, X_2, X_3, X_4, X_5, X_6, X_7, X_8, X_9, X_10,
    X_11, X_12, X_13, X_14, X_15, X_16;

logic [31:0] O_1, O_2;

assign X_1 = 32'hbff89375;
assign X_2 = 32'h3f1e6320;
assign X_3 = 32'h3fc7c1be;
assign X_4 = 32'hbec49ba6;
assign X_5 = 32'h3f47a0f9;
assign X_6 = 32'h3e29e1b1;
assign X_7 = 32'h3f1e6320;
assign X_8 = 32'h3e29e1b1;
assign X_9 = 32'h3e4779a7;
assign X_10 = 32'h3f1e6320;
assign X_11 = 32'hbfb1ce07;
assign X_12 = 32'h3e4779a7;
assign X_13 = 32'h3f1e6320;
assign X_14 = 32'hbf6a0f91;
assign X_15 = 32'hbec49ba6;
assign X_16 = 32'hbec9ba5e;




neural_net nn (.*);

endmodule : nn_wrapper