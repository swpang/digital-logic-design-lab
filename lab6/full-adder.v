`timescale 1ns/1ps

module fa (
    input a,
    input b,
    input cin,
    output s,
    output cout
);
    wire w1, w2, w3;

    xor (w1, a, b);
    xor (s, w1, cin);
    and (w2, w1, cin);
    and (w3, a, b);
    or (cout, w2, w3);
endmodule
