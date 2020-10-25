`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2020 10:58:18 PM
// Design Name: 
// Module Name: sub1bit
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


module sub1bit(
	input A,
	input B,
	input Bin,
	output D,
	output Bout
);

wire X3, X4, X5, X6, X7;


xor U2 (D,X3, Bin);

xor U3 (X3,A, B);

and U4 (X4,B, X6);

and U5 (X5,X7, Bin);

not U6 (X6,A);

not U7 (X7,X3);

or U8 (Bout,X4, X5);

endmodule

