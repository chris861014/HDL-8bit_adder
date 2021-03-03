module FA(sum, c_out, a, b, c_in);
    input c_in;
    input a,b;
    output c_out;
    output sum;

    wire s1,c1,s2;

    xor(s1,a,b);
    and(c1,a,b);
    xor(sum,s1,c_in);
    and(s2,s1,c_in);
    xor(c_out,c1,s2);

endmodule

module adder_structure(s, co, a, b, ci);
    parameter width = 8;
    input [width-1:0]a,b;
    input ci;
    output co;
    output [width-1:0]s;
    wire [width:0] ca;
    assign ca[0] = ci;

    genvar = i;

    generate;
        for(i=0;i<width;i=i+1)
            FA(s[i],ca[i+1],a[i],b[i],ca[i]);
    endgenerate 

    assign co = ca[width];


endmodule