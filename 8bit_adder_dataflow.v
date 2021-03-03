module adder_dataflow(s,ci,a,b,co);
    parameter width = 8;

    input [width-1:0]a,b;
    input ci;
    output [width-1:0]s;
    output co;

    assign {co,s} = a + b + ci; //dataflow用assign



    
endmodule