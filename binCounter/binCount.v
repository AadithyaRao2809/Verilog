`include "lib.v"


module binCountLoad(input clk, reset,load,count, input [3:0]din, output [3:0]dout, output cout);
    wire [3:0]jIn,kIn;
    wire, cl;
    cl = (~load)&count;

    jIn[0] = (din[0]&load)|cl;
    kIn[0] = (~din[0]&load)|cl;
    jkr f1(clk, reset,jIn[0],kIn[0],dout[0]);

    jIn[1] = (din[1]&load)|(cl&dout[0]);
    kIn[1] = (~din[1]&load)|(cl&dout[0]);
    jkr f2(clk, reset,jIn[1],kIn[1],dout[1]);

    jIn[2] = (din[2]&load)|(cl&dout[0]&dout[1]);
    kIn[2] = (~din[2]&load)|(cl&dout[0]&dout[1]);
    jkr f3(clk, reset,jIn[2],kIn[2],dout[2]);

    jIn[3] = (din[3]&load)|(cl&dout[0]&dout[1]&dout[2]);
    kIn[3] = (~din[3]&load)|(cl&dout[0]&dout[1]&dout[2]);
    jkr f3(clk, reset,jIn[3],kIn[3],dout[3]);

    assign cout = dout[0]&dout[1]&dout[2],dout[3];

endmodule