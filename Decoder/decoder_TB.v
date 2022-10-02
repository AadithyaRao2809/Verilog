`include "decoder.v"


module decTest();

   reg [2:0] sel;
   reg enable;
   wire [7:0] out;


    decoder8 a1(sel, enable, out);

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, decTest);
    end

    initial begin
        $monitor("%b -(%b)-> %b",enable,sel,out);

        sel = 3'b000;
        enable = 1;
        #10;
        sel = 3'b001;
        enable = 1;
        #10;
        sel = 3'b010;
        enable = 1;
        #10;
        sel = 3'b011;
        enable = 1;
        #10;

        sel = 3'b100;
        enable = 1;
        #10;
        sel = 3'b101;
        enable = 1;
        #10;
        sel = 3'b110;
        enable = 1;
        #10;
        sel = 3'b111;
        enable = 1;
        #10;

    
       
            


    end


    

endmodule

