`include "../Gates/gates.v"

module halfAdder(input wire a,b, output wire s,c);
    Xor sum1(a,b,s);
    And carry1(a,b,c);
endmodule

module fullAdder(input wire a,b,cIn, output wire sum,carry);
    wire sum1, carry1, carry2; 

    halfAdder a1(a,b, sum1,carry1);
    halfAdder a2(sum1,cIn, sum,carry2);

    Or suma1a2(carry1,carry2,carry);

endmodule

module fourBitAdder(input wire [3:0] a,b, input wire cin, output wire [3:0] sum, output wire cout);
    wire c[2:0];

    fullAdder h0(a[0],b[0],cin, sum[0], c[0]);
    fullAdder f1(a[1],b[1],c[0], sum[1], c[1]);
    fullAdder f2(a[2],b[2],c[1], sum[2], c[2]);
    fullAdder f3(a[3],b[3],c[2], sum[3], cout);


endmodule