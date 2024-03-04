`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.02.2024 12:53:50
// Design Name: 
// Module Name: instruction_memory
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
module instruction_memory(
    //IO ports
    input clk,
    input reset,
    input  [31:0] read_addr,
    output [31:0] instr_out
    );
   
    reg [31:0] Memory [0:255];
    assign instr_out = Memory[read_addr];
    
    initial begin
        $display("..................Instruction_Memory is executed.............................");
//        $readmemh("hexadecimal_3.hex",Memory);
        $readmemh("C:\\Users\\shiva\\Desktop\\RISC- V\\hex_all_instr.hex",Memory);
        $monitor("@%0t,......................Intruction is stored in instruction memory..............",$time);

      //  $readmemh("C:\Users\shiva\RISC FETCH\RISC FETCH.srcs\sim_1\new\hex.v",Memory);
        
    //  $monitor("@time=%0t,read_addr=%0h,instr_out=%0h",$time,read_addr,instr_out);
    end 
endmodule






    
//    always @(posedge clk, negedge reset)
//    begin
//    if(~reset)
//        Memory[k] = 'b0;
//    else
//        Memory[k] = read_addr ;
//       for(k=0;k<255;k=k+1)
//    begin
//    Memory[k] = k;
//    end
//    end
//     always @(posedge clk) begin
//    Memory[0]= 32'h018c533;
//    Memory[1]= 32'h018c533;
//    Memory[2]= 32'h018c533;
   
//    Memory[0]= 32'h00a59513;
//    Memory[1]= 32'h00a51513;
//    Memory[2]= 32'h00a49513;
//    Memory[3]= 32'h00a41513;
//    Memory[4]= 32'h00a39513;
//    Memory[5]= 32'h00a31513;
//    Memory[6]= 32'h00a29513;
//    Memory[7]= 32'h00a09513;
//    Memory[8]= 32'h00a50513;
//    Memory[9]= 32'h00a50513;
//    Memory[10]=32'h00a50513;
//    Memory[11]=32'h00a50513;
//  subi
//     Memory[8]= 32'h00a01513;
//    Memory[9]= 32'h00a01513;
 //   end
    
    