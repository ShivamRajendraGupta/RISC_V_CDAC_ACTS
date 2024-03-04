`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.02.2024 12:51:07
// Design Name: 
// Module Name: RISCV_TOP
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


module RISCV_TOP(
    //input [31:0] PC_in,
    input clk,
    input reset,
    output zero_flag,
    output [31:0]alu_result,
    output bt
    );
    
    // Instances of all modules
    wire [31:0]w_pc_out;
    wire [31:0]w_pc_in;
    //assign w_pc_out = PC_in;
    
    // instance of program_counter module
    program_counter pc (.clk(clk),
                        .reset(reset),
                        .PC_in(w_pc_out),
                        .PC_out(w_pc_in)
                        );
    
     // instance of PC_adder module
    PC_adder pa(
                        .a(w_pc_in),
                        .c(w_pc_out)                  
                        );
                        
     wire [31:0]w_instr_out;
      // instance of instruction_memory module
     instruction_memory im (.clk(clk),
                           .reset(reset),
                           .read_addr(w_pc_in),
                           .instr_out(w_instr_out)
                          );
       
     
    wire [31:0]w_read_data1;
    wire [31:0]w_read_data2;
     // instance of Register_file module
    Register_file rf(
                                .clk(clk),
                                .reset(reset),
                                .we3(reg_write), //  assign value for enable 
                                .write_data3(alu_result),
                                .a1(w_instr_out[19:15]),
                                .a2(w_instr_out[24:20]),
                                .a3(w_instr_out[11:7]),
                                .rd1(w_read_data1),
                                .rd2(w_read_data2)
                                 );                           
        
    wire [1:0]w_alu_sel;
    wire [2:0]w_alu_control;
     // instance of control_unit module
     control_unit ct(
                     .clk(clk),
                     .reset(reset),
                     .pc_reg(w_instr_out),
                     .alu_sel(w_alu_sel),
                     .alu_control(w_alu_control),   
                     .reg_write(reg_write),   
                     .mem_write(mem_write), 
                     .result_src(result_src) 
                     );
       
     wire [31:0]w_alu_result;
      // instance of ALU_design module
     ALU_design ad(
                      .clk(clk),  
                      .reset(reset),
                      .read_data1(w_read_data1),
                      .read_data2(w_read_data2),
                      .alu_control(w_alu_control),
                      .alu_sel(w_alu_sel),
                      .alu_result(w_alu_result),
                      .zero_flag(zero_flag),
                      .bt(bt)
                     );
     
     wire [31:0]w_read_data;
    // assign w_alu_result = alu_result;
     // instance of data_memory module
     data_memory dm(
        .clk(clk),
        .reset(reset),
        .addr(w_read_data2),
        .write_data(w_alu_result),    
        .wr_en(mem_write),
        .read_data(w_read_data)
        );
       
        // instance of multiplexer module
      mux mu(
              .a(w_alu_result),
              .b(w_read_data),
              .s(result_src),
              .c(alu_result) 
              );  
        
endmodule
