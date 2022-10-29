module top(
    input clk, 
    input rstn, 
    input sw_n, 
    output [7:0] segout 
    );
 
    wire [3:0] bin_data; 

    //BCD Counter 
    bcd_counter bcd_counter(        
    .clk(clk),
    .rstn(rstn),
    .i_toggle(sw_n),
    .data_out(bin_data)
    ); 
    
    //7-segment output to display 
    bin2seg bin2seg(
    .bin_data(bin_data),
    .seg_out(segout)
    );

endmodule