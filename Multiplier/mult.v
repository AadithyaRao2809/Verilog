`include "../Adder/adder.v"
`include "lib.v"


module twosComp4(input[3:0]in,output[3:0]out);
    wire [3:0] ones;
    wire carry,cout;
    xor2 x0(in[0],in[3],ones[0]);
    xor2 x1(in[1],in[3],ones[1]);
    xor2 x2(in[2],in[3],ones[2]);
    xor2 x3(in[3],in[3],ones[3]);

    fourBitAdder f1(ones,4'b0000,in[3],out[3:0],carry);


endmodule


module twosComp8_en(input[7:0]in,input en,output[7:0]out);
    wire [7:0] ones;
    wire [1:0]carry;
    wire cout;
    xor2 x0(in[0],en,ones[0]);
    xor2 x1(in[1],en,ones[1]);
    xor2 x2(in[2],en,ones[2]);
    xor2 x3(in[3],en,ones[3]);
    xor2 x4(in[4],en,ones[4]);
    xor2 x5(in[5],en,ones[5]);
    xor2 x6(in[6],en,ones[6]);
    xor2 x7(in[7],en,ones[7]);

    fourBitAdder f1(ones[3:0],4'b0000,en,out[3:0],carry[0]);
    fourBitAdder f2(ones[7:4],4'b0000,carry[0],out[7:4],carry[1]);


endmodule

/*

module signed_mult_4bit (input[3:0]a,b, output[7:0]out);

    wire [3:0]ma,mb;
    wire sign;
    wire [7:0]mo;

    twosComp4 ca(a,ma);    
    twosComp4 cb(b,mb);

    // mult m1(ma,mb,mo);

    xor2 x1(ma[15],mb[15],sign);

    twosComp8_en co(mo,sign, out);


    
endmodule

module mult(input p,m,q,cIn, output o,cOut);
    wire adderIn;
    
    and2 a1(m,q,adderIn);

    fullAdder f1(p,adderIn,cIn,o,cOut);

endmodule

module mult_4bit (input[3:0]m,q, output[7:0]out);
    wire [3:0]c[3:0];
    wire [2:0]s[2:0];

    mult m00(1'b0,m[0],q[0],1'b0,    out[0],c[0][0]);
    mult m01(1'b0,m[1],q[0],c[0][0],s[0][0],c[0][1]);
    mult m02(1'b0,m[2],q[0],c[0][1],s[0][1],c[0][2]);
    mult m03(1'b0,m[3],q[0],c[0][2],s[0][2],c[0][3]);

    mult m10(s[0][0],m[0],q[1],1'b0,    out[1],c[1][0]);
    mult m11(s[0][1],m[1],q[1],c[1][0],s[1][0],c[1][1]);
    mult m12(s[0][2],m[2],q[1],c[1][1],s[1][1],c[1][2]);
    mult m13(c[0][3],m[3],q[1],c[1][2],s[1][2],c[1][3]);

    mult m20(s[1][0],m[0],q[2],1'b0,    out[2],c[2][0]);
    mult m21(s[1][1],m[1],q[2],c[2][0],s[2][0],c[2][1]);
    mult m22(s[1][2],m[2],q[2],c[2][1],s[2][1],c[2][2]);
    mult m23(c[1][3],m[3],q[2],c[2][2],s[2][2],c[2][3]);

    mult m30(s[2][0],m[0],q[3],1'b0,   out[3],c[3][0]);
    mult m31(s[2][1],m[1],q[3],c[3][0],out[4],c[3][1]);
    mult m32(s[2][2],m[2],q[3],c[3][1],out[5],c[3][2]);
    mult m33(c[2][3],m[3],q[3],c[3][2],out[6], out[7]);


    
endmodule
*/