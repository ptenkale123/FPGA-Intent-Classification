//-------------------------------------------------------------------------
//    Color_Mapper.sv                                                    --
//    Stephen Kempf                                                      --
//    3-1-06                                                             --
//                                                                       --
//    Modified by David Kesler  07-16-2008                               --
//    Translated by Joe Meng    07-07-2013                               --
//                                                                       --
//    Fall 2014 Distribution                                             --
//                                                                       --
//    For use with ECE 385 Lab 7                                         --
//    University of Illinois ECE Department                              --
//-------------------------------------------------------------------------


/*
SW1 - neutral (yellow)
SW2 - positive (green)
SW3 - negative (red)
*/
module  color_mapper ( input  logic [31:0] CLASS_DIFF,
							  input  logic blank,
                       output logic [7:0]  Red, Green, Blue ); 

	// > 1.25 is for green, 0.25 to 1.25 is yellow, and < 0.25 is red

	logic greater_1_25;
	logic greater_0_25;

	assign greater_1_25 = (CLASS_DIFF[30:23] > 8'b01111111) | ((CLASS_DIFF[30:23] == 8'b01111111) 
						& (CLASS_DIFF[22:0] > 23'b01000000000000000000000));

	assign greater_0_25 = (CLASS_DIFF[30:23] > 8'b01111101) | ((CLASS_DIFF[30:23] == 8'b01111101) 
						& (CLASS_DIFF[22:0] > 23'b00000000000000000000000));

    always_comb
    begin
		if (blank) begin
			Red = 8'h00;
			Green = 8'h00;
			Blue = 8'h00;
		end
		else if (greater_1_25) begin
			// green
			Red = 8'h00; 
			Green = 8'h7f;
			Blue = 8'h00;
		end
		else if (greater_0_25) begin
			// yellow
			Red = 8'h7f;
			Green = 8'h7f;
			Blue = 8'h00;
		end
		else begin
			// red
			Red = 8'h7f; 
			Green = 8'h00;
			Blue = 8'h00;
		end
    end
    
endmodule