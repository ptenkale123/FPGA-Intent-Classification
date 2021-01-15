module nn_partition (
    input logic [31:0] X_1, X_2, X_3, X_4, X_5, X_6, X_7, X_8, X_9, X_10,
    X_11, X_12, X_13, X_14, X_15, X_16, X_17, X_18, X_19, X_20,
    X_21, X_22, X_23, X_24, X_25, X_26, X_27, X_28, X_29, X_30,
    X_31, X_32, X_33, X_34, X_35, X_36, X_37, X_38, X_39, X_40,
    X_41, X_42, X_43, X_44, X_45, X_46, X_47, X_48, X_49, X_50,
    X_51, X_52, X_53, X_54, X_55, X_56, X_57, X_58, X_59, X_60,
    X_61, X_62, X_63, X_64,

    W_1, W_2, W_3, W_4, W_5, W_6, W_7, W_8, W_9, W_10,
    W_11, W_12, W_13, W_14, W_15, W_16, W_17, W_18, W_19, W_20,
    W_21, W_22, W_23, W_24, W_25, W_26, W_27, W_28, W_29, W_30,
    W_31, W_32, W_33, W_34, W_35, W_36, W_37, W_38, W_39, W_40,
    W_41, W_42, W_43, W_44, W_45, W_46, W_47, W_48, W_49, W_50,
    W_51, W_52, W_53, W_54, W_55, W_56, W_57, W_58, W_59, W_60,
    W_61, W_62, W_63, W_64,
    
    bias,

    output logic [31:0] out
);


// multiply output variables
logic [31:0] a_1, a_2, a_3, a_4, a_5, a_6, a_7, a_8, a_9, a_10,
a_11, a_12, a_13, a_14, a_15, a_16, a_17, a_18, a_19, a_20,
a_21, a_22, a_23, a_24, a_25, a_26, a_27, a_28, a_29, a_30,
a_31, a_32, a_33, a_34, a_35, a_36, a_37, a_38, a_39, a_40,
a_41, a_42, a_43, a_44, a_45, a_46, a_47, a_48, a_49, a_50,
a_51, a_52, a_53, a_54, a_55, a_56, a_57, a_58, a_59, a_60,
a_61, a_62, a_63, a_64;

// first level addition variables
logic [31:0] b_2, b_4, b_6, b_8, b_10,
b_12, b_14, b_16, b_18, b_20,
b_22, b_24, b_26, b_28, b_30,
b_32, b_34, b_36, b_38, b_40,
b_42, b_44, b_46, b_48, b_50,
b_52, b_54, b_56, b_58, b_60,
b_62, b_64;

// second level addition variables
logic [31:0] c_4, c_8, c_12, c_16,
c_20, c_24, c_28, c_32,
c_36, c_40, c_44, c_48,
c_52, c_56, c_60, c_64;

// third level addition variables
logic [31:0] d_8, d_16, d_24, d_32, d_40, d_48, d_56, d_64;

// fourth level addition variables
logic [31:0] e_16, e_32, e_48, e_64;

// fifth level addition variables
logic [31:0] f_32, f_64;

// sixth level addition variables
logic [31:0] g_64;


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
Float_Mul mul_17 (.a(X_17), .b(W_17), .c(a_17));
Float_Mul mul_18 (.a(X_18), .b(W_18), .c(a_18));
Float_Mul mul_19 (.a(X_19), .b(W_19), .c(a_19));
Float_Mul mul_20 (.a(X_20), .b(W_20), .c(a_20));
Float_Mul mul_21 (.a(X_21), .b(W_21), .c(a_21));
Float_Mul mul_22 (.a(X_22), .b(W_22), .c(a_22));
Float_Mul mul_23 (.a(X_23), .b(W_23), .c(a_23));
Float_Mul mul_24 (.a(X_24), .b(W_24), .c(a_24));
Float_Mul mul_25 (.a(X_25), .b(W_25), .c(a_25));
Float_Mul mul_26 (.a(X_26), .b(W_26), .c(a_26));
Float_Mul mul_27 (.a(X_27), .b(W_27), .c(a_27));
Float_Mul mul_28 (.a(X_28), .b(W_28), .c(a_28));
Float_Mul mul_29 (.a(X_29), .b(W_29), .c(a_29));
Float_Mul mul_30 (.a(X_30), .b(W_30), .c(a_30));
Float_Mul mul_31 (.a(X_31), .b(W_31), .c(a_31));
Float_Mul mul_32 (.a(X_32), .b(W_32), .c(a_32));
Float_Mul mul_33 (.a(X_33), .b(W_33), .c(a_33));
Float_Mul mul_34 (.a(X_34), .b(W_34), .c(a_34));
Float_Mul mul_35 (.a(X_35), .b(W_35), .c(a_35));
Float_Mul mul_36 (.a(X_36), .b(W_36), .c(a_36));
Float_Mul mul_37 (.a(X_37), .b(W_37), .c(a_37));
Float_Mul mul_38 (.a(X_38), .b(W_38), .c(a_38));
Float_Mul mul_39 (.a(X_39), .b(W_39), .c(a_39));
Float_Mul mul_40 (.a(X_40), .b(W_40), .c(a_40));
Float_Mul mul_41 (.a(X_41), .b(W_41), .c(a_41));
Float_Mul mul_42 (.a(X_42), .b(W_42), .c(a_42));
Float_Mul mul_43 (.a(X_43), .b(W_43), .c(a_43));
Float_Mul mul_44 (.a(X_44), .b(W_44), .c(a_44));
Float_Mul mul_45 (.a(X_45), .b(W_45), .c(a_45));
Float_Mul mul_46 (.a(X_46), .b(W_46), .c(a_46));
Float_Mul mul_47 (.a(X_47), .b(W_47), .c(a_47));
Float_Mul mul_48 (.a(X_48), .b(W_48), .c(a_48));
Float_Mul mul_49 (.a(X_49), .b(W_49), .c(a_49));
Float_Mul mul_50 (.a(X_50), .b(W_50), .c(a_50));
Float_Mul mul_51 (.a(X_51), .b(W_51), .c(a_51));
Float_Mul mul_52 (.a(X_52), .b(W_52), .c(a_52));
Float_Mul mul_53 (.a(X_53), .b(W_53), .c(a_53));
Float_Mul mul_54 (.a(X_54), .b(W_54), .c(a_54));
Float_Mul mul_55 (.a(X_55), .b(W_55), .c(a_55));
Float_Mul mul_56 (.a(X_56), .b(W_56), .c(a_56));
Float_Mul mul_57 (.a(X_57), .b(W_57), .c(a_57));
Float_Mul mul_58 (.a(X_58), .b(W_58), .c(a_58));
Float_Mul mul_59 (.a(X_59), .b(W_59), .c(a_59));
Float_Mul mul_60 (.a(X_60), .b(W_60), .c(a_60));
Float_Mul mul_61 (.a(X_61), .b(W_61), .c(a_61));
Float_Mul mul_62 (.a(X_62), .b(W_62), .c(a_62));
Float_Mul mul_63 (.a(X_63), .b(W_63), .c(a_63));
Float_Mul mul_64 (.a(X_64), .b(W_64), .c(a_64));


// // 1st level parallelized addition
Float_Add add_a_2 (.a(a_1), .b(a_2), .c(b_2));
Float_Add add_a_4 (.a(a_3), .b(a_4), .c(b_4));
Float_Add add_a_6 (.a(a_5), .b(a_6), .c(b_6));
Float_Add add_a_8 (.a(a_7), .b(a_8), .c(b_8));
Float_Add add_a_10 (.a(a_9), .b(a_10), .c(b_10));
Float_Add add_a_12 (.a(a_11), .b(a_12), .c(b_12));
Float_Add add_a_14 (.a(a_13), .b(a_14), .c(b_14));
Float_Add add_a_16 (.a(a_15), .b(a_16), .c(b_16));
Float_Add add_a_18 (.a(a_17), .b(a_18), .c(b_18));
Float_Add add_a_20 (.a(a_19), .b(a_20), .c(b_20));
Float_Add add_a_22 (.a(a_21), .b(a_22), .c(b_22));
Float_Add add_a_24 (.a(a_23), .b(a_24), .c(b_24));
Float_Add add_a_26 (.a(a_25), .b(a_26), .c(b_26));
Float_Add add_a_28 (.a(a_27), .b(a_28), .c(b_28));
Float_Add add_a_30 (.a(a_29), .b(a_30), .c(b_30));
Float_Add add_a_32 (.a(a_31), .b(a_32), .c(b_32));
Float_Add add_a_34 (.a(a_33), .b(a_34), .c(b_34));
Float_Add add_a_36 (.a(a_35), .b(a_36), .c(b_36));
Float_Add add_a_38 (.a(a_37), .b(a_38), .c(b_38));
Float_Add add_a_40 (.a(a_39), .b(a_40), .c(b_40));
Float_Add add_a_42 (.a(a_41), .b(a_42), .c(b_42));
Float_Add add_a_44 (.a(a_43), .b(a_44), .c(b_44));
Float_Add add_a_46 (.a(a_45), .b(a_46), .c(b_46));
Float_Add add_a_48 (.a(a_47), .b(a_48), .c(b_48));
Float_Add add_a_50 (.a(a_49), .b(a_50), .c(b_50));
Float_Add add_a_52 (.a(a_51), .b(a_52), .c(b_52));
Float_Add add_a_54 (.a(a_53), .b(a_54), .c(b_54));
Float_Add add_a_56 (.a(a_55), .b(a_56), .c(b_56));
Float_Add add_a_58 (.a(a_57), .b(a_58), .c(b_58));
Float_Add add_a_60 (.a(a_59), .b(a_60), .c(b_60));
Float_Add add_a_62 (.a(a_61), .b(a_62), .c(b_62));
Float_Add add_a_64 (.a(a_63), .b(a_64), .c(b_64));

// // 2nd level parallelized addition
Float_Add add_b_4 (.a(b_2), .b(b_4), .c(c_4));
Float_Add add_b_8 (.a(b_6), .b(b_8), .c(c_8));
Float_Add add_b_12 (.a(b_10), .b(b_12), .c(c_12));
Float_Add add_b_16 (.a(b_14), .b(b_16), .c(c_16));
Float_Add add_b_20 (.a(b_18), .b(b_20), .c(c_20));
Float_Add add_b_24 (.a(b_22), .b(b_24), .c(c_24));
Float_Add add_b_28 (.a(b_26), .b(b_28), .c(c_28));
Float_Add add_b_32 (.a(b_30), .b(b_32), .c(c_32));
Float_Add add_b_36 (.a(b_34), .b(b_36), .c(c_36));
Float_Add add_b_40 (.a(b_38), .b(b_40), .c(c_40));
Float_Add add_b_44 (.a(b_42), .b(b_44), .c(c_44));
Float_Add add_b_48 (.a(b_46), .b(b_48), .c(c_48));
Float_Add add_b_52 (.a(b_50), .b(b_52), .c(c_52));
Float_Add add_b_56 (.a(b_54), .b(b_56), .c(c_56));
Float_Add add_b_60 (.a(b_58), .b(b_60), .c(c_60));
Float_Add add_b_64 (.a(b_62), .b(b_64), .c(c_64));

// // 3rd level parallelized addition
Float_Add add_c_8 (.a(c_4), .b(c_8), .c(d_8));
Float_Add add_c_16 (.a(c_12), .b(c_16), .c(d_16));
Float_Add add_c_24 (.a(c_20), .b(c_24), .c(d_24));
Float_Add add_c_32 (.a(c_28), .b(c_32), .c(d_32));
Float_Add add_c_40 (.a(c_36), .b(c_40), .c(d_40));
Float_Add add_c_48 (.a(c_44), .b(c_48), .c(d_48));
Float_Add add_c_56 (.a(c_52), .b(c_56), .c(d_56));
Float_Add add_c_64 (.a(c_60), .b(c_64), .c(d_64));

// // 4th level parallelized addition
Float_Add add_d_16 (.a(d_8), .b(d_16), .c(e_16));
Float_Add add_d_32 (.a(d_24), .b(d_32), .c(e_32));
Float_Add add_d_48 (.a(d_40), .b(d_48), .c(e_48));
Float_Add add_d_64 (.a(d_56), .b(d_64), .c(e_64));

// // 5th level parallelized addition
Float_Add add_e_32 (.a(e_16), .b(e_32), .c(f_32));
Float_Add add_e_64 (.a(e_48), .b(e_64), .c(f_64));

// // 6th level parallelized addition
Float_Add add_f_64 (.a(f_32), .b(f_64), .c(g_64));

// // bias addition
Float_Add add_bias (.a(g_64), .b(bias), .c(out));

endmodule : nn_partition