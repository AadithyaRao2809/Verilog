module decoder2 (input wire sel,en, output wire [1:0] out);

    assign out[0] =en&(~sel); 
    assign out[1] =sel&en; 

endmodule

module decoder4 (input wire [1:0] sel, input wire en, output wire [3:0] out);
    wire [1:0] dOut;

    decoder2 d1(sel[1], en, dOut);

    decoder2 d2(sel[0], dOut[0], out[1:0]);
    decoder2 d3(sel[0], dOut[1], out[3:2]);
endmodule

module decoder8 (input wire [2:0] sel, input wire en, output wire [7:0] out);
    wire [1:0] dOut;

    decoder2 d1(sel[2], en, dOut);

    decoder4 d2(sel[1:0],dOut[0],out[3:0]);
    decoder4 d3(sel[1:0],dOut[1],out[7:4]);

     
endmodule