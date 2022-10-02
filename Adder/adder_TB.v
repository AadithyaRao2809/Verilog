`include "adder.v"




module adder4Test();

    reg [3:0]A,B;
    reg cin;     

    wire [3:0]sum;
    wire cout;
    


    fourBitAdder a1(A,B,cin,sum,cout);

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, adder4Test);
    end

    initial begin

        $monitor("%b + %b = %b%b",A,B,cout,sum);

        A = 4'b0101;
        B = 4'b1001;
        cin = 0;
        #10;
        A = 4'b0110;
        B = 4'b1001;
        cin = 0;
        #10;
        A = 4'b1111;
        B = 4'b0001;
        cin = 0;
        #10;
            


    end


    

endmodule 


module adderTest();

    reg A,B;
    reg cin;     

    wire sum;
    wire cout;
    


    fullAdder a1(A,B,cin,sum,cout);

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, adderTest);
    end

    initial begin

        $monitor(A," + ",B," + ",cin," = ",cout,sum);

        A = 1'b0;
        B = 1'b0;
        cin = 1'b0;
        #10;
        A = 1'b0;
        B = 1'b1;
        cin = 1'b0;
        #10;
        A = 1'b1;
        B = 1'b0;
        cin = 1'b0;
        #10;
        A = 1'b1;
        B = 1'b1;
        cin = 1'b0;
        #10;

        A = 1'b0;
        B = 1'b0;
        cin = 1'b1;
        #10;
        A = 1'b0;
        B = 1'b1;
        cin = 1'b1;
        #10;
        A = 1'b1;
        B = 1'b0;
        cin = 1'b1;
        #10;
        A = 1'b1;
        B = 1'b1;
        cin = 1'b1;
        #10;
            


    end


    

endmodule
*/