`timescale 1ns / 1ps

module string_pattern_recognizer (
    input_data, 
    reset, 
    clk, 
    output_data);

    localparam S0 = 3'b000,
               S1 = 3'b001,
               S2 = 3'b010,
               S3 = 3'b011,
               S4 = 3'b100,
               S5 = 3'b101,
               S6 = 3'b110;

    input input_data;
    input reset;
    input clk;
    output reg output_data;

    reg [2:0] state;

    // always @(state) $display(state);

    initial state = 3'b111;

    always @(posedge clk) begin
        if (reset)
            state <= 3'b000;
        else begin
            case (state)
                S0 : begin
                    if (input_data == 1)    state <= S1;
                    else                    state <= S4;
                end
                S1 : begin
                    if (input_data == 1)    state <= S1;
                    else                    state <= S2;
                end
                S2 : begin
                    if (input_data == 1)    state <= S3;
                    else                    state <= S5;
                end
                S3 : begin
                    if (input_data == 1)    state <= S1;
                    else                    state <= S2;
                end
                S4 : begin
                    if (input_data == 1)    state <= S1;
                    else                    state <= S5;
                end
                S5 : begin
                    if (input_data == 1)    state <= S1;
                    else                    state <= S6;
                end
                S6 : state <= S6;
            endcase
        end
    end

    always @(*) begin
        if (state == S3)                    output_data = 1'b1;
        else if (state == 3'b111)           output_data = output_data;
        else                                output_data = 1'b0;
    end
endmodule

