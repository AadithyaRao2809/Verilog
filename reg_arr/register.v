`include "lib.v"

// module dfrl (input wire clk, reset, load, in, output wire out);

module reg16 (input [0:15] i, input clk, reset,load, output [0:15] o);
    dfrl d0(clk,reset,load,i[0],o[0]);
    dfrl d1(clk,reset,load,i[1],o[1]);
    dfrl d2(clk,reset,load,i[2],o[2]);
    dfrl d3(clk,reset,load,i[3],o[3]);
    dfrl d4(clk,reset,load,i[4],o[4]);
    dfrl d5(clk,reset,load,i[5],o[5]);
    dfrl d6(clk,reset,load,i[6],o[6]);
    dfrl d7(clk,reset,load,i[7],o[7]);
    dfrl d8(clk,reset,load,i[8],o[8]);
    dfrl d9(clk,reset,load,i[9],o[9]);
    dfrl d10(clk,reset,load,i[10],o[10]);
    dfrl d11(clk,reset,load,i[11],o[11]);
    dfrl d12(clk,reset,load,i[12],o[12]);
    dfrl d13(clk,reset,load,i[13],o[13]);
    dfrl d14(clk,reset,load,i[14],o[14]);
    dfrl d15(clk,reset,load,i[15],o[15]);
    
endmodule

module reg_array (input [0:15]i, input clk, reset, input [0:7]load, output [0:15]o0,o1,o2,o3,o4,o5,o6,o7);

    reg16 r1(i, clk, reset, load[0], o0);
    reg16 r2(i, clk, reset, load[1], o1);
    reg16 r3(i, clk, reset, load[2], o2);
    reg16 r4(i, clk, reset, load[3], o3);
    reg16 r5(i, clk, reset, load[4], o4);
    reg16 r6(i, clk, reset, load[5], o5);
    reg16 r7(i, clk, reset, load[6], o6);
    reg16 r8(i, clk, reset, load[7], o7);
endmodule

module mux8_16(input [0:15]i0,i1,i2,i3,i4,i5,i6,i7, input [0:2]j, output [0:15]o);
    mux8 m0({i0[0],i1[0],i2[0],i3[0],i4[0],i5[0],i6[0],i7[0]},j[0],j[1],j[2], o[0]);
    mux8 m1({i0[1],i1[1],i2[1],i3[1],i4[1],i5[1],i6[1],i7[1]},j[0],j[1],j[2], o[1]);
    mux8 m2({i0[2],i1[2],i2[2],i3[2],i4[2],i5[2],i6[2],i7[2]},j[0],j[1],j[2], o[2]);
    mux8 m3({i0[3],i1[3],i2[3],i3[3],i4[3],i5[3],i6[3],i7[3]},j[0],j[1],j[2], o[3]);
    mux8 m4({i0[4],i1[4],i2[4],i3[4],i4[4],i5[4],i6[4],i7[4]},j[0],j[1],j[2], o[4]);
    mux8 m5({i0[5],i1[5],i2[5],i3[5],i4[5],i5[5],i6[5],i7[5]},j[0],j[1],j[2], o[5]);
    mux8 m6({i0[6],i1[6],i2[6],i3[6],i4[6],i5[6],i6[6],i7[6]},j[0],j[1],j[2], o[6]);
    mux8 m7({i0[7],i1[7],i2[7],i3[7],i4[7],i5[7],i6[7],i7[7]},j[0],j[1],j[2], o[7]);
    mux8 m8({i0[8],i1[8],i2[8],i3[8],i4[8],i5[8],i6[8],i7[8]},j[0],j[1],j[2], o[8]);
    mux8 m9({i0[9],i1[9],i2[9],i3[9],i4[9],i5[9],i6[9],i7[9]},j[0],j[1],j[2], o[9]);
    mux8 m10({i0[10],i1[10],i2[10],i3[10],i4[10],i5[10],i6[10],i7[10]},j[0],j[1],j[2], o[10]);
    mux8 m11({i0[11],i1[11],i2[11],i3[11],i4[11],i5[11],i6[11],i7[11]},j[0],j[1],j[2], o[11]);
    mux8 m12({i0[12],i1[12],i2[12],i3[12],i4[12],i5[12],i6[12],i7[12]},j[0],j[1],j[2], o[12]);
    mux8 m13({i0[13],i1[13],i2[13],i3[13],i4[13],i5[13],i6[13],i7[13]},j[0],j[1],j[2], o[13]);
    mux8 m14({i0[14],i1[14],i2[14],i3[14],i4[14],i5[14],i6[14],i7[14]},j[0],j[1],j[2], o[14]);
    mux8 m15({i0[15],i1[15],i2[15],i3[15],i4[15],i5[15],i6[15],i7[15]},j[0],j[1],j[2], o[15]);
endmodule

module reg_file (input clk,reset,wr, input [0:2]rd_addr_a,rd_addr_b,wr_addr, input [0:15]d_in, output[0:15]d_out_a, d_out_b);
//   reg_file reg_file_0 (clk, reset, wr, rd_addr_a, rd_addr_b, wr_addr, d_in, d_out_a, d_out_b);

    
    wire [0:7] load;
    wire [0:15] ro0,ro1,ro2,ro3,ro4,ro5,ro6,ro7;

   demux8 d(wr, wr_addr[0],wr_addr[1],wr_addr[2],load);

   reg_array arr(d_in, clk, reset, load, ro0,ro1,ro2,ro3,ro4,ro5,ro6,ro7);

   mux8_16 mA(ro0,ro1,ro2,ro3,ro4,ro5,ro6,ro7, rd_addr_a, d_out_a);
   mux8_16 mB(ro0,ro1,ro2,ro3,ro4,ro5,ro6,ro7, rd_addr_b, d_out_b);
endmodule





