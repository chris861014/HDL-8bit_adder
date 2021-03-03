module adder_behavior(s,co,a,b,ci);
    parameter width = 8;

    input [width-1:0]a,b;
    input ci;
    output [width-1:0]s;
    output co;

    reg  [width-1:0]s;  //behavior要用reg
    reg co;

    always @(*) 
    begin
        {co,s} = a + b + ci;
    end
    
endmodule