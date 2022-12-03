`timescale 1 ns / 100 ps
`include "mult.v"

module tb;
  reg clk,reset, START,LSB,DONE;
  reg signed [7:0] A_in,B_in;
  wire [15:0] RC;
  wire STOP,LOAD_cmd,ADD_cmd,SHIFT_cmd,COUNT;
  initial begin $dumpfile("dump.vcd"); $dumpvars(0,tb); end
  initial begin reset = 1'b1; #12.5 reset = 1'b0; end
  initial clk = 1'b0; always #5 clk =~ clk;

    

  controlUnit test1(clk,reset, START,LSB,DONE,STOP,LOAD_cmd,ADD_cmd,SHIFT_cmd,COUNT);

initial begin
    $monitor(START,LSB);
    #100
    START = 1'b1; #30 START = 1'b0;
    #100
    LSB = 1'b1; #30 LSB = 1'b0;


    #1000
    $display("%d * %d = %d",A_in,B_in,RC);
    $finish;

end


endmodule