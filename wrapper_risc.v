`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.02.2024 22:32:24
// Design Name: 
// Module Name: wrapper_risc
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module wrapper_risc(
 input wire GCLK,
    input wire btnC,
    //input wire [1:0]sw,
    output wire [7:0]led
    );
   wire [31:0]zync_in;
    RISCV_TOP Jmd(
        .clk(GCLK),
        .reset(~btnC),
        .alu_result(zync_in)
        );
    assign led = zync_in[7:0];
endmodule
