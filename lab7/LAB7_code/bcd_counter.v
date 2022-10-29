module bcd_counter(
    input clk, // When clk is rising edge, the counter works.
    input rstn, // When rstn is falling edge, the counter resets.
    input i_toggle, // Active low
    output [3:0] data_out //Binary output
    );

    reg [3:0] state;
    assign data_out = state;

    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            state <= 4'b0000;
        end
        else begin
            if (!i_toggle) begin
                if (state < 4'b1001) begin
                    state <= state + 4'b1;
                end 
                else begin
                    state <= 4'b0000;
                end
            end
        end
    end
endmodule