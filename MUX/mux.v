

module mux2(input wire [1:0] a,input wire sel, output wire out);
    assign out = ((~sel)&a[0])|((sel&a[1]));
endmodule


module mux4(input wire [3:0] i, input wire [1:0] s, output wire out);
    wire [1:0] muxOut;
    mux2 m1(i[1:0], s[0], muxOut[0]);
    mux2 m2(i[3:2], s[0], muxOut[1]);

    mux2 m3(muxOut, s[1], out); 
endmodule

module mux8 (input wire [7:0] i, input wire [2:0] s, output wire out);
    wire [1:0] muxOut;

    mux4 m1(i[3:0], s[1:0], muxOut[0]);
    mux4 m2(i[7:4], s[1:0], muxOut[1]);

    mux2 m3(muxOut, s[2], out);
    
endmodule
    


    