`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:42:15 04/10/2024 
// Design Name: 
// Module Name:    Regfile 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

`include "definations.v"
`define OUTPUT_REG 4 // As asked in manual
 
module Regfile(clk, state, rsource, rtemp, rdestination, result, result_valid, rsourcev, rtempv
    );

    input clk,result_valid;
    // rsource and rtemp are source register operands and rdestination is the destination register operand
	input[4:0] rsource;
	input[4:0] rtemp;
	input[4:0] rdestination;
	input[2:0] state;
    // Store the result if it is a valid operation
	input[7:0] result;
	output reg[7:0] rsourcev;
	output reg[7:0] rtempv;
    // Create the registerFile of 8x32
	reg[7:0] RegisterFile [0:31];
	
	always @ (posedge clk) begin
        // If the state is output then output on the LEDS
        if (state == `STATE_OUTPUT) begin
		   	rsourcev <= RegisterFile[`OUTPUT_REG];
		end
        // If the state is to fetch the register
	   	else if (state==`STATE_RF) begin
		   	rsourcev<=RegisterFile[rsource];
			rtempv<=RegisterFile[rtemp];
		end
        // If the state is WB then write back if the result is valid
		else if ((result_valid == 1)&&(state==`STATE_WB)) begin
		   	RegisterFile[rdestination] <= result;
		end

	end
	
	initial begin
	   	RegisterFile[0] = 0;
		RegisterFile[1] = 0;
		RegisterFile[2] = 0;
		RegisterFile[3] = 0;
		RegisterFile[4] = 0;
		RegisterFile[5] = 0;
		RegisterFile[6] = 0;
		RegisterFile[7] = 0;
		RegisterFile[8] = 0;
		RegisterFile[9] = 0;
		RegisterFile[10] = 0;
		RegisterFile[11] = 0;
		RegisterFile[12] = 0;
		RegisterFile[13] = 0;
		RegisterFile[14] = 0;
		RegisterFile[15] = 0;
		RegisterFile[16] = 0;
		RegisterFile[17] = 0;
		RegisterFile[18] = 0;
		RegisterFile[19] = 0;
		RegisterFile[20] = 0;
		RegisterFile[21] = 0;
		RegisterFile[22] = 0;
		RegisterFile[23] = 0;
		RegisterFile[24] = 0;
		RegisterFile[25] = 0;
		RegisterFile[26] = 0;
		RegisterFile[27] = 0;
		RegisterFile[28] = 0;
		RegisterFile[29] = 0;
		RegisterFile[30] = 0;
		RegisterFile[31] = 0;
	end
endmodule
