`include "gates.v"

module gatesTestBench();

    reg A, B;
    wire notGate, andGate, orGate, norGate, nandGate, xorGate, xnorGate;


    And g1(A,B,andGate);
    Or g2(A,B,orGate);
    Nor g3(A,B,norGate);
    Nand g4(A,B,nandGate);
    Xor g5(A,B,xorGate);
    Xnor g6(A,B,xnorGate);
    Not g7(A,notGate); 

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, gatesTestBench);
    end

    initial begin
        $monitor(A, B," ", notGate," ", andGate," ", orGate," ", norGate," ", nandGate," ", xorGate," ", xnorGate);

        A = 1'b0;
        B= 1'b0;
        #10
        
        A = 1'b0;
        B= 1'b1;
        #10
        
        A = 1'b1;
        B= 1'b0;
        #10

        A = 1'b1;
        B= 1'b1;
        #10;
               


    end


    

endmodule