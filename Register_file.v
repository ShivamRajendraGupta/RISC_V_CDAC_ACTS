`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.02.2024 12:54:45
// Design Name: 
// Module Name: Register_file
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

module Register_file(
    //IO ports
    input  clk,
    input  reset,
    input  we3,
    input  [4:0]a1,a2,a3,
    input  [31:0]write_data3,
    output [31:0]rd1,rd2
    );

    reg [31:0] Register [31:0];
    
    //Body of RTL code
    assign rd1 = (~reset) ? 32'd0 : Register[a1];
    assign rd2 = (~reset) ? 32'd0 : Register[a2];

    always @ (posedge clk)
    begin
        if(we3)
            Register[a3] <= write_data3;
    end

   
    always @(posedge clk)//, negedge reset) 
    begin
         Register[0]  = 32'd0;
         Register[1]  = 32'd1;
         Register[2]  = 32'd2;
         Register[3]  = 32'd3;
         Register[4]  = 32'd4;
         Register[5]  = 32'd5;
         Register[6]  = 32'd6;
         Register[7]  = 32'd7;
         Register[8]  = 32'd8;
         Register[9]  = 32'd9;
         Register[10] = 32'd10;
         Register[11] = 32'd11;
         Register[12] = 32'd12;
         Register[13] = 32'd13;
         Register[14] = 32'd14;
         Register[15] = 32'd15;
         Register[16] = 32'd16;
         Register[17] = 32'd17;
         Register[18] = 32'd18;
         Register[19] = 32'd19;
         Register[20] = 32'd20;
         Register[21] = 32'd21;
         Register[22] = 32'd22;
         Register[23] = 32'd23;
         Register[24] = 32'd24;
         Register[25] = 32'd25;
		 Register[26] = 32'd26;
         Register[27] = 32'd27;
         Register[28] = 32'd28;
         Register[29] = 32'd29;
         Register[30] = 32'd30;
         Register[31] = 32'd31;
    end

         initial
         $monitor("@%0t,......................Register File ..............",$time);

endmodule