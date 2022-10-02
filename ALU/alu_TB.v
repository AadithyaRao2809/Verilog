`include "alu.v"
/*

module alu_TB();

    reg [15:0] i0, i1;
    reg [1:0] sel;

    wire  [15:0] res;
    wire cout;
    
    alu16 a16(i0,i1,sel,res,cout);

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, alu_TB);
    end

    initial begin
        $monitor("%h %h sel:%b out:%h %h",i0,i1,sel,cout,res);

        i0 = 16'hff00;        
        i1 = 16'h00ab;        
        sel = 2'b00; 
        #10;       

        i0 = 16'hffa0;        
        i1 = 16'h00ff;        
        sel = 2'b01; 
        #10;       
        
        i0 = 16'hffa0;        
        i1 = 16'h00ff;        
        sel = 2'b10; 
        #10;       

        i0 = 16'hffa0;        
        i1 = 16'h00ff;        
        sel = 2'b11; 
        #10;       
        

    
    end

endmodule

*/
module alu_TB();

    reg i0, i1, cin;
    reg [1:0] sel;

    wire res;
    wire cout;
    
    // module alu(input wire i0, i1, input wire [1:0]s,input wire cIn,output wire res, cOut);
    alu a(i0,i1,sel,cin,res,cout);

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, alu_TB);
    end

    initial begin
        $monitor("%b %b %b sel:%b out:%b %b",i0,i1,cin,sel,cout,res);

        i0 = 1'b1;
        i1 = 1'b0;

        sel = 2'b00;
        cin = 1'b1;
        
        
    end

endmodule 