`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2020 03:38:17 PM
// Design Name: 
// Module Name: Reg8
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


module RegA(
	input en_a,
	input clk,
	input [7:0] A,
	output [7:0] Q
);


dff_en U2 (
	.data_out(Q[0]),
	.in_D( A[0] ),
	.in_CLK( clk ),
	.in_EN( en_a )
);

dff_en U74 (
	.data_out(Q[1]),
	.in_D( A[1] ),
	.in_CLK( clk ),
	.in_EN( en_a )
);

dff_en U83 (
	.data_out(Q[2]),
	.in_D( A[2] ),
	.in_CLK( clk ),
	.in_EN( en_a )
);

dff_en U92 (
	.data_out(Q[3]),
	.in_D( A[3] ),
	.in_CLK( clk ),
	.in_EN( en_a )
);

dff_en U101 (
	.data_out(Q[4]),
	.in_D( A[4] ),
	.in_CLK( clk ),
	.in_EN( en_a )
);

dff_en U110 (
	.data_out(Q[5]),
	.in_D( A[5] ),
	.in_CLK( clk ),
	.in_EN( en_a )
);

dff_en U119 (
	.data_out(Q[6]),
	.in_D( A[6] ),
	.in_CLK( clk ),
	.in_EN( en_a )
);

dff_en U128 (
	.data_out(Q[7]),
	.in_D( A[7] ),
	.in_CLK( clk ),
	.in_EN( en_a )
);

endmodule

