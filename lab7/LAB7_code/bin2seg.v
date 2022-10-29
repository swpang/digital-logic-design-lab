module bin2seg (
    input [3:0] bin_data, // Binary input data
    output [7:0] seg_out // 7-segment output data (index 7 is don't care)
    );

    // **** TODO **** //
    reg [7:0] seg_out;

    always @(bin_data) begin
        case (bin_data)
            4'b0000 : seg_out = 8'b00000001;
            4'b0001 : seg_out = 8'b11001111;
            4'b0010 : seg_out = 8'b10010010;
            4'b0011 : seg_out = 8'b10000110;
            4'b0100 : seg_out = 8'b11001100;
            4'b0101 : seg_out = 8'b10100100;
            4'b0110 : seg_out = 8'b10100000;
            4'b0111 : seg_out = 8'b10001111;
            4'b1000 : seg_out = 8'b10000000;
            4'b1001 : seg_out = 8'b10000100;
            default : seg_out = 8'b11111111; 
        endcase
    end
    // ************** // 
endmodule
