`include "../Adder/adder.v"
`include "../MUX/mux.v"

module alu(input i0, i1, input [1:0]s,input cIn,output res, cOut);

    wire adderOut, muxOut, adderIn, muxAnd, muxOr;
    Xor x1(i1,s[0],adderIn);
    And a1(i0,i1,muxAnd);
    Or o1(i0,i1,muxOr);

    fullAdder A1(i0,adderIn,cIn,adderOut,cOut);

    mux2 m1({muxOr,muxAnd},s[0],muxOut);
    mux2 m2({muxOut,adderOut},s[1],res);
    

endmodule

module alu16(input wire [15:0] i0, i1, input wire [1:0] sel, output wire [15:0] out, output wire cout);
    wire [15:0] c;

        alu a1(i0[0],i1[0],sel,sel[0],out[0],c[0]);
        alu a2(i0[1],i1[1],sel,c[0],out[1],c[1]);
        alu a3(i0[2],i1[2],sel,c[1],out[2],c[2]);
        alu a4(i0[3],i1[3],sel,c[2],out[3],c[3]);
        alu a5(i0[4],i1[4],sel,c[3],out[4],c[4]);
        alu a6(i0[5],i1[5],sel,c[4],out[5],c[5]);
        alu a7(i0[6],i1[6],sel,c[5],out[6],c[6]);
        alu a8(i0[7],i1[7],sel,c[6],out[7],c[7]);
        alu a9(i0[8],i1[8],sel,c[7],out[8],c[8]);
        alu a10(i0[9],i1[9],sel,c[8],out[9],c[9]);
        alu a11(i0[10],i1[10],sel,c[9],out[10],c[10]);
        alu a12(i0[11],i1[11],sel,c[10],out[11],c[11]);
        alu a13(i0[12],i1[12],sel,c[11],out[12],c[12]);
        alu a14(i0[13],i1[13],sel,c[12],out[13],c[13]);
        alu a15(i0[14],i1[14],sel,c[13],out[14],c[14]);
        alu a16(i0[15],i1[15],sel,c[14],out[15],c[15]);

        Xor x1(c[14],c[15],cout);
        
    

endmodule
