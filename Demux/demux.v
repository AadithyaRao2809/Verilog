module demux2 (input wire inp,sel, output wire [1:0] out);

    assign out[0] =sel&(~inp); 
    assign out[1] =inp&sel; 

endmodule

module demux4 (input wire [1:0] inp, input wire sel, output wire [3:0] out);
    wire [1:0] dOut;

    demux2 d1(inp[1], sel, dOut);

    demux2 d2(inp[0], dOut[0], out[1:0]);
    demux2 d3(inp[0], dOut[1], out[3:2]);
endmodule

module demux8 (input wire [2:0] inp, input wire sel, output wire [7:0] out);
    wire [1:0] dOut;

    demux2 d1(inp[2], sel, dOut);

    demux4 d2(inp[1:0],dOut[0],out[3:0]);
    demux4 d3(inp[1:0],dOut[1],out[7:4]);

     
endmodule