`timescale 1ns/1ps

module spr_tb;

    reg clk;
    reg reset;
    reg in;
    wire out;

    reg [27:0] input_stream;
    integer i;
    
    initial clk = 1'b0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile ("dumpfile.vcd");
        $dumpvars;
    end

    always @(posedge clk) begin
        //$write ("%b", in);
        $write ("%b", out);
    end
    
    string_pattern_recognizer DUT (.input_data(in), .reset(reset), .clk(clk), .output_data(out));

    initial begin
        input_stream = 28'b0111001010111110100100000101;
        reset = 1'b0;

        #15 reset = 1'b1;
        #7 reset = 1'b0;

        for (i = 0; i < 28; i = i + 1) begin
            in = input_stream[27 - i];
            #10;
        end

        #10;
        $finish;
    end
endmodule