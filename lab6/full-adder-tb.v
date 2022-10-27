`timescale 1ns/1ps

module fa_tb;
    reg a, b, cin;
    wire s, cout;

    fa DUT (.a(a), .b(b), .cin(cin), .s(s), .cout(cout));

    initial begin
        a = 0;
        b = 0;
        cin = 0;
        #10 $display("%d + %d + %d = %d%d", a, b, cin, cout, s);

        a = 1;
        b = 0;
        cin = 0;
        #10 $display("%d + %d + %d = %d%d", a, b, cin, cout, s);

        a = 1;
        b = 1;
        cin = 0;
        #10 $display("%d + %d + %d = %d%d", a, b, cin, cout, s);

        a = 0;
        b = 0;
        cin = 1;
        #10 $display("%d + %d + %d = %d%d", a, b, cin, cout, s);

        a = 1;
        b = 0;
        cin = 1;
        #10 $display("%d + %d + %d = %d%d", a, b, cin, cout, s);

        a = 1;
        b = 0;
        cin = 1;
        #10 $display("%d + %d + %d = %d%d", a, b, cin, cout, s);

        a = 1;
        b = 1;
        cin = 1;
        #10 $display("%d + %d + %d = %d%d", a, b, cin, cout, s);
    end
endmodule
