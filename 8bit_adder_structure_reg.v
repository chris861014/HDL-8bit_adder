module D_FF(q,d,clk);
    parameter width = 8;
    output reg [width:0]q;  //Q記得用reg
    input [width:0]d;
    input clk;
    always @(posedge clk)   //正緣觸發
    begin
        q <= d;   
    end
    
endmodule


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

module adder_structure_reg(s,ci,a,b,co);
    parameter width = 8;

    input clk;

    input [width-1:0]a,b;
    input ci;
    output co;
    output [width-1:0]s;

    wire [width:0]ca;           //每層8+1個carry in

    
    wire [width-1:0] temp_s;    //創一個temp的sum
    wire temp_co;               //創一個temp的cout

    assign ca[0] = ci;

    genvar = i; //for裡宣告int type要用genvar
    generate    //for迴圈如果沒有用在always裡，要加generate
        for(i=0;i<width;i=i+1)
            FA(temp_s[i],ca[i+1],a[i],b[i],ca[i]);
    endgenerate 

    assign temp_co = ca[width];

    D_FF dff({co,s},{temp_co,temp_s},clk);  //將temp的值放入真正cout跟sum中

    

endmodule


