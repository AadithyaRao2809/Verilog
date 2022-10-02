`include "mux.v"



/* 

module muxTest();

   reg [7:0] i;
   reg [2:0]s;
   wire o;


    mux8 a1(i,s,o);

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, muxTest);
    end

    initial begin
        $monitor("%b -(%b)-> %b",i,s,o);

        i = 8'b00000100;
        s = 3'b000;
        #10;
        i = 8'b00000100;
        s = 3'b001;
        #10;
        i = 8'b00000100;
        s = 3'b010;
        #10;
        i = 8'b00000100;
        s = 3'b011;
        #10;

        i = 8'b00000100;
        s = 3'b100;
        #10;
        i = 8'b00000100;
        s = 3'b101;
        #10;
        i = 8'b00000100;
        s = 3'b110;
        #10;
        i = 8'b00000100;
        s = 3'b111;
        #10;
        
       
            


    end


    

endmodule */

module muxTest();

   reg [1:0]i;
   reg s;
   wire o;


    mux2 a1(i,s,o);

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, muxTest);
    end

    initial begin
        $monitor("%b -(%b)-> %b",i,s,o);

        i = 2'b01;
        s = 1;
        #10

        i = 2'b 10;
        s = 1;
        #10

        i = 2'b01;
        s = 0;
        #10

        i = 2'b 10;
        s = 0;
        
        
        
       
            


    end


    

endmodule