`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/07/2020 02:21:22 PM
// Design Name: 
// Module Name: mux4
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


module mux4
#( 	parameter k=16 //bus width
 )
(	input  [k-1:0] in3,in2,in1,in0,
	input [1:0] sel,
	output reg [k-1:0] out
);
	//multiplexer
	always@(*)
		case(sel)
			2'b00: out=in0;
			2'b01: out=in1;
			2'b10: out=in2;
			2'b11: out=in3;
			default: out={k{1'bx}};
		endcase
endmodule