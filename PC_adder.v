`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.02.2024 12:53:12
// Design Name: 
// Module Name: PC_adder
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
module PC_adder(
    //IO ports
    input  [31:0]a,
    output [31:0]c
    );
    
    // Body of RTL code
     assign  c = (a + 1);
    
     initial
     $monitor("@%0t,......................Program Counter is increased by 1..............",$time);
endmodule
