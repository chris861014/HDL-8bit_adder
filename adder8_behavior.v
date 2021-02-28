module adder_behavior (s, co, a, b, ci);
	parameter width = 8;
	output reg[width-1:0] s;
	output reg co;
	input [width-1:0] a, b;
	input ci;

	always @ (a or b or ci) begin
		{co,s} = a+b+ci;

	end

endmodule