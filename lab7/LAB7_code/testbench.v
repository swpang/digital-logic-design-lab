`timescale 1ns/1ps

module testbench;

  reg clk;
  reg rstn;
  reg sw_n;
  wire [7:0] segout;

  reg [7:0] in;

  display your_display(
    .clk(clk),
    .in(segout)
    );
  
  top top(
    .clk(clk), 
    .rstn(rstn), 
    .sw_n(sw_n), 
    .segout(segout) 
    );

  initial clk = 1'b0;
  always #5 clk = ~clk;

  initial begin
    rstn = 1'b0;
    sw_n = 1'b1;
    #10 
    rstn = 1'b1;
    sw_n = 1'b0;
    #120 
    sw_n = 1'b1;
    #10 
    rstn = 1'b0;
    #10 
    $finish;
  end

endmodule

module display (
  input clk,
  input [7:0] in
);


  task DisplayLED(input [7:0] in);
    begin
    if(!in[6]) begin
      $write(" __\n");
    end else begin
      $write("   \n");
    end

    if(!in[1]) begin
      $write("|");
    end else begin
      $write(" ");
    end

    if(!in[0]) begin
      $write("__");
    end else begin
      $write("  ");
    end

    if(!in[5]) begin
      $write("|\n");
    end else begin
      $write(" \n");
    end

    if(!in[2]) begin
      $write("|");
    end else begin
      $write(" ");
    end

    if(!in[3]) begin
      $write("__");
    end else begin
      $write("  ");
    end

    if(!in[4]) begin
      $write("|\n");
    end else begin
      $write(" \n");
    end
  end
  endtask

  always@(posedge clk) begin
    DisplayLED(in);
  end
endmodule