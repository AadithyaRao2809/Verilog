module And(input wire a,b, output wire y);
    assign y = a&b;

endmodule

module Or(input wire a,b, output wire y);
    assign y = a|b;

endmodule

module Nor(input wire a,b, output wire y);
    assign y = ~(a|b);

endmodule

module Nand(input wire a,b, output wire y);
    assign y = ~(a&b);

endmodule

module Xor(input wire a,b, output wire y);
    assign y = a^b;

endmodule

module Xnor(input wire a,b, output wire y);
    assign y = ~(a^b);

endmodule

module Not(input wire a, output wire y);
    assign y = ~a;

endmodule