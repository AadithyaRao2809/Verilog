`include "../Adder/adder.v"
`include "lib.v"

module multiplicand (input clk, reset, LOAD_cmd, input [7:0]A_in, output [7:0] RA);
    dfrl m0(clk,reset,LOAD_cmd, A_in[0], RA[0]);
    dfrl m1(clk,reset,LOAD_cmd, A_in[1], RA[1]);
    dfrl m2(clk,reset,LOAD_cmd, A_in[2], RA[2]);
    dfrl m3(clk,reset,LOAD_cmd, A_in[3], RA[3]);
    dfrl m4(clk,reset,LOAD_cmd, A_in[4], RA[4]);
    dfrl m5(clk,reset,LOAD_cmd, A_in[5], RA[5]);
    dfrl m6(clk,reset,LOAD_cmd, A_in[6], RA[6]);
    dfrl m7(clk,reset,LOAD_cmd, A_in[7], RA[7]);    
endmodule


module controlUnit(input clk,reset, START,LSB,DONE, output STOP,LOAD_cmd,ADD_cmd,SHIFT_cmd,COUNT);


    wire an,bn,cn,sn,ln,dn,rn;         //not of all i/p
    wire a,b,c;                     //state vars for FSM
    wire[2:0]a_sop,b_sop;
    wire[1:0]c_sop;                 //vars for sop
    wire a_next,b_next,c_next;      //next state vars
    

    not(an,a);not(bn,b);
    not(cn,c);not(sn,START);
    not(ln,LSB);not(dn,DONE);
    not(rn,reset);


    and(a_sop[0],b,cn,LSB);
    and(a_sop[1],b,dn,LSB);
    and(a_sop[2],an,bn,cn,d);
    or(a_next,a_sop[0],a_sop[1],a_sop[2]);      //next state eqn for a

    and(b_sop[0],bn,c);
    and(b_sop[1],a,dn);
    and(b_sop[2],b,cn,LSB);
    or(b_next,b_sop[0],b_sop[1],b_sop[2]);      //next state eqn for b

    and(c_sop[0],b,ln);
    and(c_sop[1],b,c);
    or(c_next,c_sop[0],c_sop[1]);      //next state eqn for c


    and(STOP,an,bn,cn,rn);             //eqn for stop
    and(LOAD_cmd,bn,c);             //eqn for load
    and(SHIFT_cmd,a,bn,cn);         //eqn for shift
    and(COUNT,a,bn,cn);             //eqn for count

    dfr da(clk, reset, a_next,a);
    dfr db(clk, reset, b_next,b);
    dfr dc(clk, reset, c_next,c);



    
endmodule

module mux2_9bit(input[8:0]in1,in2,input sel, output[8:0] out);
    mux2 m0(in1[0],in2[0],sel,out[0]);
    mux2 m1(in1[1],in2[1],sel,out[1]);
    mux2 m2(in1[2],in2[2],sel,out[2]);
    mux2 m3(in1[3],in2[3],sel,out[3]);
    mux2 m4(in1[4],in2[4],sel,out[4]);
    mux2 m5(in1[5],in2[5],sel,out[5]);
    mux2 m6(in1[6],in2[6],sel,out[6]);
    mux2 m7(in1[7],in2[7],sel,out[7]);
    mux2 m8(in1[8],in2[8],sel,out[8]);
endmodule

module mux2_8bit(input[7:0]in1,in2,input sel, output[7:0] out);
    mux2 m0(in1[0],in2[0],sel,out[0]);
    mux2 m1(in1[1],in2[1],sel,out[1]);
    mux2 m2(in1[2],in2[2],sel,out[2]);
    mux2 m3(in1[3],in2[3],sel,out[3]);
    mux2 m4(in1[4],in2[4],sel,out[4]);
    mux2 m5(in1[5],in2[5],sel,out[5]);
    mux2 m6(in1[6],in2[6],sel,out[6]);
    mux2 m7(in1[7],in2[7],sel,out[7]);
endmodule

module mux2_16bit(input[15:0]in1,in2,input sel, output[15:0] out);
    mux2 m0(in1[0],in2[0],sel,out[0]);
    mux2 m1(in1[1],in2[1],sel,out[1]);
    mux2 m2(in1[2],in2[2],sel,out[2]);
    mux2 m3(in1[3],in2[3],sel,out[3]);
    mux2 m4(in1[4],in2[4],sel,out[4]);
    mux2 m5(in1[5],in2[5],sel,out[5]);
    mux2 m6(in1[6],in2[6],sel,out[6]);
    mux2 m7(in1[7],in2[7],sel,out[7]);
    mux2 m8(in1[8],in2[8],sel,out[8]);
    mux2 m9(in1[9],in2[9],sel,out[9]);
    mux2 m10(in1[10],in2[10],sel,out[10]);
    mux2 m11(in1[11],in2[11],sel,out[11]);
    mux2 m12(in1[12],in2[12],sel,out[12]);
    mux2 m13(in1[13],in2[13],sel,out[13]);
    mux2 m14(in1[14],in2[14],sel,out[14]);
    mux2 m15(in1[15],in2[15],sel,out[15]);
endmodule

module fullAdder8bit(input [7:0] a,b, input cin, output [7:0] sum, output cout);
    wire c[6:0];

    fullAdder f0(a[0],b[0],cin, sum[0], c[0]);
    fullAdder f1(a[1],b[1],c[0], sum[1], c[1]);
    fullAdder f2(a[2],b[2],c[1], sum[2], c[2]);
    fullAdder f3(a[3],b[3],c[2], sum[3], c[3]);
    fullAdder f4(a[4],b[4],c[3], sum[4], c[4]);
    fullAdder f5(a[5],b[5],c[4], sum[5], c[5]);
    fullAdder f6(a[6],b[6],c[5], sum[6], c[6]);
    fullAdder f7(a[7],b[7],c[6], sum[7], cout);


endmodule


module multiplier (input clk,reset,LOAD_cmd,SHIFT_cmd,ADD_cmd,C_out, input[7:0]Add_out,B_in, output LSB, output[15:0]RC,output[7:0]RB);

    wire[7:0] acc_out,q_out, acc_in,q_in;
    wire[7:0] loader;
    wire load;

    wire carry_in, carry_out;


    wire[8:0] mux_out;



    or(load,SHIFT_cmd,LOAD_cmd);

    mux2_9bit addSel({carry_out,acc_out},{C_out,Add_out},ADD_cmd,mux_out);      //selects acc ot sum of acc and m

    mux2_16bit shifter({acc_out,q_out},{mux_out,q_out[7:1]},SHIFT_cmd,{acc_in,loader});   //slects original or shifted values

    mux2_8bit loader_mux(loader,B_in,LOAD_cmd,q_in);

    mux2 c_sel(C_out,1'b0,SHIFT_cmd,carry_in);

    dfrl q0(clk,reset,load,q_in[0],q_out[0]);
    dfrl q1(clk,reset,load,q_in[1],q_out[1]);
    dfrl q2(clk,reset,load,q_in[2],q_out[2]);
    dfrl q3(clk,reset,load,q_in[3],q_out[3]);
    dfrl q4(clk,reset,load,q_in[4],q_out[4]);
    dfrl q5(clk,reset,load,q_in[5],q_out[5]);
    dfrl q6(clk,reset,load,q_in[6],q_out[6]);
    dfrl q7(clk,reset,load,q_in[7],q_out[7]);       //8-bit q register

    dfrl a0(clk,reset,load,acc_in[0],acc_out[0]);
    dfrl a1(clk,reset,load,acc_in[1],acc_out[1]);
    dfrl a2(clk,reset,load,acc_in[2],acc_out[2]);
    dfrl a3(clk,reset,load,acc_in[3],acc_out[3]);
    dfrl a4(clk,reset,load,acc_in[4],acc_out[4]);
    dfrl a5(clk,reset,load,acc_in[5],acc_out[5]);
    dfrl a6(clk,reset,load,acc_in[6],acc_out[6]);
    dfrl a7(clk,reset,load,acc_in[7],acc_out[7]);   //8-bit a register

    dfrl c(clk,res,load,carry_in,carry_out);

    assign LSB = q_out[0];
    assign RC = {acc_out,q_out};
    assign RB = acc_out;
    
endmodule


module counter3bit(input clk,reset,en, output DONE);
    wire[2:0]count;
    wire[1:0]enCount;

    and(enCount[0],count[0],en);
    and(enCount[1],count[1],en);

    tfr t0(clk,reset,en,count[0]);
    tfr t1(clk,reset,enCount[0],count[1]);
    tfr t2(clk,reset,enCount[1],count[2]);


    and(DONE, count);
endmodule

module shift_add (input clk,reset,input [7:0]A_in,B_in,output[15:0]RC,output STOP);
    wire LSB,ADD_cmd,SHIFT_cmd,LOAD_cmd,C_out,DONE,COUNT;
    wire[7:0]RA,RB,Add_out;

    multiplicand multcand(clk,reset, LOAD_cmd,A_in,RA);

    controlUnit cu(clk,reset,reset,LSB,DONE,STOP,LOAD_cmd,ADD_cmd,SHIFT_cmd,COUNT);
    counter3bit counter3(clk,reset,COUNT, DONE);




    fullAdder8bit ripple(RA,RB,1'b0,Add_out,C_cout);



    multiplier multplier(clk,reset,LOAD_cmd,SHIFT_cmd,ADD_cmd,C_out,Add_out,B_in,LSB,RC,RB);



endmodule




