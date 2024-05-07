`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:43:49 04/10/2024 
// Design Name: 
// Module Name:    Control_state 
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
module Control_state(clk, PC, state
    );

   input clk;
   	input[7:0] PC;
	output reg[2:0] state;
	
	always @ (posedge clk) begin
	   	if ((PC<11)&&(state==`STATE_WB))begin
         		state<=`STATE_IF;
		end
		else if(state!=`STATE_OUTPUT)begin
		   		state<=state+1'b1;
		end
	end

   initial begin
	   	state<=`STATE_IF;
	end
	
endmodule