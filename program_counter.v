`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.02.2024 12:52:33
// Design Name: 
// Module Name: program_counter
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

module program_counter(
    //IO ports
    input clk,reset,
    input [31:0] PC_in,
    output reg [31:0] PC_out
        );
    
        reg count;
        // Body of RTL code
        always @(posedge clk , negedge reset)
        begin
        if(!reset)begin
            PC_out <= 32'h0;
            count = 'b0;
        end
        else if (count == 1'b1)
        begin 
            PC_out <= PC_in;
            count <= 'b0;
        end
        else
            count <= count + 1;
        end    
   
        initial
        begin
         $display("..................Program_Counter is executed.............................");
         
        // $monitor("@time=%0t,clk = %0h,reset=%0h,PC_in=%0h,PC_out=%0h",$time,clk,reset,PC_in,PC_out,);
        end
endmodule