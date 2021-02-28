module FA (sum, c_out, a, b, c_in);
	output sum;
	output c_out;
	input a, b;
	input c_in;
	wire s1,c1,s2;
	
	xor(s1,a,b);
	and(c1,a,b);
	xor(sum,s1,c_in);
	and(s2,s1,c_in);
	xor(c_out,s2,c1);
	
endmodule

module adder_structure (s, co, a, b, ci);
	parameter width = 8;
	output [width-1:0] s;
	output co;
	input [width-1:0] a, b;
	input ci;
	wire [width:0] c;
	
	assign c[0]=ci;
	
	genvar i;
	generate
		for(i=0;i<width;i=i+1)
			begin:FA_LOOP
				FA fa(s[i],c[i+1],a[i],b[i],c[i]);
			end
	endgenerate
	
	assign co=c[width];
	
endmodule