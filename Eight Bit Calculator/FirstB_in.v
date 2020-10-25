`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2020 11:04:15 PM
// Design Name: 
// Module Name: FirstB_in
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


module FirstB_in(
	input A,
	input B,
	output D,
	output Bout
);

wire X88;


xor U85 (D,A, B);

and U86 (Bout,X88, B);

not U88 (X88,A);

endmodule
