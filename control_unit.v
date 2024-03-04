`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.02.2024 12:55:24
// Design Name: 
// Module Name: control_unit
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

module control_unit(
    //IO ports
    input clk,
    input reset,
    input [31:0] pc_reg,
    output reg [1:0] alu_sel,
    output reg [2:0] alu_control,
    output reg_write,
    output mem_write,
    output result_src
    );
    
    //Body of RTL code
    always @(posedge clk, negedge reset)
    begin
        if(!reset)
        begin 
            alu_control = 'b0;
            alu_sel = 'b0;
        end    
        
        else
        begin
            alu_control = pc_reg[14:12];
            case(pc_reg[6:0])
                7'b0110011: alu_sel = 2'b00; //REGISTER SELECTION
                7'b0010011: alu_sel = 2'b01; //IMMIDIATE SELECTION            
                7'b1100011: alu_sel = 2'b10; //BRANCH SELECTION
                default :   alu_sel = 'b0;      
            endcase    
        end
    end
    
    assign reg_write  = (pc_reg[6:0] == 7'b0000011 | pc_reg[6:0] == 7'b0110011) ? 1'b1 : 1'b0 ;
    assign mem_write  = (pc_reg[6:0] == 7'b0100011) ? 1'b1 : 1'b0 ;
    assign result_src = (pc_reg[6:0] == 7'b0000011) ? 1'b1 : 1'b0 ;
       
    initial
     $display("..................Control_Unit is executed.............................");
    // $monitor("@time=%0t,pc_reg = %0h,alu_sel=%0h,alu_control=%0h",$time,pc_reg,alu_sel,alu_control);
endmodule
