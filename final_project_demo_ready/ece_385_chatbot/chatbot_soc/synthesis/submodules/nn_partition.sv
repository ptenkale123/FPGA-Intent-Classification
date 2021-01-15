module nn_partition (
    input logic [31:0] X_1, X_2, X_3, X_4, X_5, X_6, X_7, X_8, X_9, X_10,
    X_11, X_12, X_13, X_14, X_15, X_16,

    W_1, W_2, W_3, W_4, W_5, W_6, W_7, W_8, W_9, W_10,
    W_11, W_12, W_13, W_14, W_15, W_16,
    
    bias,

    output logic [31:0] out
);


// multiply output variables
logic [31:0] a_1, a_2, a_3, a_4, a_5, a_6, a_7, a_8, a_9, a_10,
a_11, a_12, a_13, a_14, a_15, a_16;

// first level addition variables
logic [31:0] b_2, b_4, b_6, b_8, b_10,
b_12, b_14, b_16;

// second level addition variables
logic [31:0] c_4, c_8, c_12, c_16;

// third level addition variables
logic [31:0] d_8, d_16;

// fourth level addition variables
logic [31:0] e_16;

// multiplying input vector with weight vector
Float_Mul mul_1 (.a(X_1), .b(W_1), .c(a_1));
Float_Mul mul_2 (.a(X_2), .b(W_2), .c(a_2));
Float_Mul mul_3 (.a(X_3), .b(W_3), .c(a_3));
Float_Mul mul_4 (.a(X_4), .b(W_4), .c(a_4));
Float_Mul mul_5 (.a(X_5), .b(W_5), .c(a_5));
Float_Mul mul_6 (.a(X_6), .b(W_6), .c(a_6));
Float_Mul mul_7 (.a(X_7), .b(W_7), .c(a_7));
Float_Mul mul_8 (.a(X_8), .b(W_8), .c(a_8));
Float_Mul mul_9 (.a(X_9), .b(W_9), .c(a_9));
Float_Mul mul_10 (.a(X_10), .b(W_10), .c(a_10));
Float_Mul mul_11 (.a(X_11), .b(W_11), .c(a_11));
Float_Mul mul_12 (.a(X_12), .b(W_12), .c(a_12));
Float_Mul mul_13 (.a(X_13), .b(W_13), .c(a_13));
Float_Mul mul_14 (.a(X_14), .b(W_14), .c(a_14));
Float_Mul mul_15 (.a(X_15), .b(W_15), .c(a_15));
Float_Mul mul_16 (.a(X_16), .b(W_16), .c(a_16));


// 1st level parallelized addition
Float_Add add_a_2 (.a(a_1), .b(a_2), .c(b_2));
Float_Add add_a_4 (.a(a_3), .b(a_4), .c(b_4));
Float_Add add_a_6 (.a(a_5), .b(a_6), .c(b_6));
Float_Add add_a_8 (.a(a_7), .b(a_8), .c(b_8));
Float_Add add_a_10 (.a(a_9), .b(a_10), .c(b_10));
Float_Add add_a_12 (.a(a_11), .b(a_12), .c(b_12));
Float_Add add_a_14 (.a(a_13), .b(a_14), .c(b_14));
Float_Add add_a_16 (.a(a_15), .b(a_16), .c(b_16));

// 2nd level parallelized addition
Float_Add add_b_4 (.a(b_2), .b(b_4), .c(c_4));
Float_Add add_b_8 (.a(b_6), .b(b_8), .c(c_8));
Float_Add add_b_12 (.a(b_10), .b(b_12), .c(c_12));
Float_Add add_b_16 (.a(b_14), .b(b_16), .c(c_16));

// 3rd level parallelized addition
Float_Add add_c_8 (.a(c_4), .b(c_8), .c(d_8));
Float_Add add_c_16 (.a(c_12), .b(c_16), .c(d_16));

// // 4th level parallelized addition
Float_Add add_d_16 (.a(d_8), .b(d_16), .c(e_16));

// // bias addition
Float_Add add_bias (.a(e_16), .b(bias), .c(out));

endmodule : nn_partition