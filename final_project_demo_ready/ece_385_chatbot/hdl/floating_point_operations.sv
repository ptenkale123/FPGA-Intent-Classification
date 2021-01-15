module Float_Add (
	input logic [31:0] a,
	input logic [31:0] b,
	output logic [31:0] c
);

	logic [24:0] mantissa_add;
	logic [31:0] larger;
	logic [31:0] smaller;


	always_comb
	begin
		if ((a[30:23] > b[30:23]) || ((a[30:23] == b[30:23]) && (a[22:0] > b[22:0]))) begin
			// a greater
			larger = a;
			smaller = b;
		end
		else begin
			// b greater or both equal
			larger = b;
			smaller = a;
		end

		if (larger[31] == smaller[31])
			mantissa_add = {1'b1, larger[22:0]} + ({1'b1, smaller[22:0]} >> (larger[30:23] - smaller[30:23]));
		else
			mantissa_add = {1'b1, larger[22:0]} - ({1'b1, smaller[22:0]} >> (larger[30:23] - smaller[30:23]));
		
		c[31] = larger[31];
		
		if (mantissa_add[24]) begin
			mantissa_add >>= 1;
			c[22:0] = mantissa_add[22:0];
			c[30:23] = larger[30:23] + 8'h01;
		end
		else if (mantissa_add[23]) begin
			c[22:0] = mantissa_add[22:0];
			c[30:23] = larger[30:23];
		end
		else if (mantissa_add[22]) begin
			mantissa_add <<= 1;
			c[22:0] = mantissa_add[22:0];
			c[30:23] = larger[30:23] - 8'h01;
		end
		else if (mantissa_add[21]) begin
			mantissa_add <<= 2;
			c[22:0] = mantissa_add[22:0];
			c[30:23] = larger[30:23] - 8'h02;
		end
		else if (mantissa_add[20]) begin
			mantissa_add <<= 3;
			c[22:0] = mantissa_add[22:0];
			c[30:23] = larger[30:23] - 8'h03;
		end
		else if (mantissa_add[19]) begin
			mantissa_add <<= 4;
			c[22:0] = mantissa_add[22:0];
			c[30:23] = larger[30:23] - 8'h04;
		end
		else if (mantissa_add[18]) begin
			mantissa_add <<= 5;
			c[22:0] = mantissa_add[22:0];
			c[30:23] = larger[30:23] - 8'h05;
		end
		else begin
			c = 32'b0;
		end

		if ((a[31] != b[31]) && (a[30:0] == b[30:0]))
			c = 32'b0;
	end

endmodule : Float_Add


module Float_Mul (
	input logic [31:0] a,
	input logic [31:0] b,
	output logic [31:0] c
);

	logic [47:0] mantissa_mult;

	always_comb
	begin
		
		c[31] = a[31] ^ b[31];

		mantissa_mult = {1'b1, a[22:0]} * {1'b1, b[22:0]};

		if (mantissa_mult[47]) begin
			mantissa_mult >>= 1;
			c[22:0] = mantissa_mult[45:23];
			c[30:23] = a[30:23] - 8'h7e + b[30:23];
		end
		else begin
			c[22:0] = mantissa_mult[45:23];
			c[30:23] = a[30:23] - 8'h7f + b[30:23];
		end

		if (a[30:0] == 31'b0 || b[30:0] == 32'b0)
			c = 32'b0;
	end

endmodule : Float_Mul
