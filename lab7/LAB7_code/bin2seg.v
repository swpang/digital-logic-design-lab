module bin2seg (
    input [3:0] bin_data, // Binary input data
    output [7:0] seg_out // 7-segment output data (index 7 is don't care)
    );

    // **** TODO **** //
    reg [7:0] out_temp;
    assign seg_out = out_temp;

    always @(*) begin
        case (bin_data)
            0000 : begin
                out_temp <= 8'b00000001;
            end

            0001 : begin
                out_temp <= 8'b11001111;
            end

            0010 : begin
                out_temp <= 8'b10010010;
            end

            0011 : begin
                out_temp <= 8'b10000110;
            end

            0100 : begin
                out_temp <= 8'b11001100;
            end

            0101 : begin
                out_temp <= 8'b0100100;
            end

            0110 : begin
                out_temp <= 8'b1010000;
            end

            0111 : begin
                out_temp <= 8'b10001111;
            end

            1000 : begin
                out_temp <= 8'b10000000;
            end

            1001 : begin
                out_temp <= 8'b10000100;
            end
        endcase
    end
    // ************** // 

endmodule
