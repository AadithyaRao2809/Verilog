`include "mult.v"
/*
module mult_test();

    reg signed [3:0]a,b;    
    wire signed [7:0]out;
    
    

    // module signed_mult (input[7:0]a,b, output[15:0]out);
    signed_mult_4bit s1(a,b,out);
    

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, mult_test);
    end

    initial begin

        $monitor("%d * %d = %d",a,b,out);

        a = 4'b0101;
        b = 4'b0010;
        #10;
        
        
            


    end
endmodule */

module comp_test();

    reg signed [3:0] a;
    wire signed [3:0] b;

    
    

    // module twosComp4(input[3:0]in,output[3:0]out);
    twosComp4 a1(a,b);

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, comp_test);
    end

    initial begin

        $monitor("%d => %d",a,b);

        a = 4'b1101;
        #10;
        
        
            


    end

endmodule


    
