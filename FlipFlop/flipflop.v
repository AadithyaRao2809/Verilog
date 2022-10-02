module df (input wire clk, in, output wire out);
  reg df_out;
  always@(posedge clk) df_out = in;
  assign out = df_out;
endmodule