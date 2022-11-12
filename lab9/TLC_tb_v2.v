`timescale 1ns/1ps

module TLC_tb;
    reg HS;
    reg FS;
    reg clk;
    reg rstn;

    wire HR;
    wire HY;
    wire HL;
    wire HG;
    wire FR;
    wire FY;
    wire FL;

    TLC TLC(
        .HS(HS),
        .FS(FS),
        .FR(FR),
        .FY(FY),
        .FL(FL),
        .HR(HR),
        .HY(HY),
        .HL(HL), 
        .HG(HG),
        .clk(clk),
        .rstn(rstn)
    );

    initial forever
        #2.5 clk = ~clk;

    initial begin
        $dumpfile ("dumpfile.vcd");
        $dumpvars;
    end

    initial begin
        HS = 0;
        FS = 0;
        clk = 1;
        rstn = 1;
        
        // ** TODO ** //
        #3 rstn = 0;
        #4 HS = 1;
        #6 FS = 1;
        #4 HS = 1;
        #9 FS = 1;
        #17 FS = 1;
        #3 HS = 1;
        #10 HS = 1;
        #21 HS = 1;
        FS = 1;
        // ********** //
        #20 $finish;
    end

    always @(HR, HY, HG, HL, FR, FY, FL) begin
        $write ($time, " : ");
        if (HR) $write ("HR");
        if (HY) $write ("HY");
        if (HG) $write ("HG");
        if (HL) $write ("HL");
        if (FR) $write ("FR");
        if (FY) $write ("FY");
        if (FL) $write ("FL");

        $write ("\n");
    end

    always @(negedge HL) begin
        HS = 0;
    end

    always @(negedge FL) begin
        FS = 0;
    end
endmodule