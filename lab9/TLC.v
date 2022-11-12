`timescale 1ns / 1ps

module TLC (clk, rstn, HS, FS, HR, HY, HG, HL, FR, FY, FL);
    // lights = HR, HY, HG, HL, FR, FY, FL
    input wire clk, rstn, HS, FS;
    output wire HR, HY, HG, HL, FR, FY, FL;
    
    reg [6:0] lights;
    reg [2:0] state;
    reg select;

    localparam S0 = 3'b000,
               S1 = 3'b001,
               S2 = 3'b010,
               S3 = 3'b011,
               S4 = 3'b100,
               S5 = 3'b101;

    assign HR = lights[6];
    assign HY = lights[5];
    assign HG = lights[4];
    assign HL = lights[3];
    assign FR = lights[2];
    assign FY = lights[1];
    assign FL = lights[0];

    always @(posedge clk or posedge rstn) begin
        if (rstn) begin
            state <= S0;
            select <= 1'b1;
        end

        else begin
            case (state)
                S0 : begin
                    if (!HS && FS) begin
                        select <= 1'b1;
                        state <= S1;
                    end
                    else if (HS) begin
                        select <= 1'b0;
                        state <= S1;
                    end
                    else state <= S0;
                end

                S1 : begin
                    if (select) begin
                        state <= S3;
                        select <= 1'b0;
                    end
                    else state <= S2;
                end

                S2 : begin
                    if (!FS)            select <= 1'b1;
                    else                select <= 1'b0;
                    state <= S5;
                end

                S3 : state <= S4;

                S4 : state <= S0;

                S5 : begin
                    if (select)         state <= S0;
                    else                state <= S3;
                end
            endcase
        end
    end

    always @(*) begin
        case (state)
            //               RYGL RYL
            S0 : lights = 7'b0010_100;
            S1 : lights = 7'b0100_100;
            S2 : lights = 7'b0001_100;
            S3 : lights = 7'b1000_001;
            S4 : lights = 7'b1000_010;
            S5 : lights = 7'b0100_100;
        endcase
    end
endmodule