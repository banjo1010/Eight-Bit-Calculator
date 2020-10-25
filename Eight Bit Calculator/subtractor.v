`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/03/2020 04:51:07 AM
// Design Name: 
// Module Name: subtractor
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


module subtractor(
	input A0,
	input B0,
	input B1,
	input A2,
	input B2,
	input A3,
	input B4,
	input A4,
	input A5,
	input B5,
	input A6,
	input B6,
	input A7,
	input B7,
	output D0,
	output D1,
	output D2,
	output D3,
	output D4,
	output D5,
	output D6,
	output D7
);

wire X3, X4, X5, X6, X7, X8, X60, X62, X64, X66, X68, X69, X81, X83, X85, X87, X89, X90, X102, X104, X106, X108, X110, X111, X123, X125, X127, X129, X131, X132, X144, X146, X148, X150, X152, X153, X165, X167, X169, X171, X173, X174, X186;


xor U2 (D0,X3, 1'b0);

xor U3 (X3,A0, B0);

and U4 (X4,X7, B0);

and U5 (X5,X6, 1'b0);

not U6 (X6,X3);

not U7 (X7,A0);

or U8 (X8,X4, X5);

xor U57 (D1,X60, X8);

xor U60 (X60,A0, B1);

and U62 (X62,X68, B1);

and U64 (X64,X66, X8);

not U66 (X66,X60);

not U68 (X68,A0);

or U69 (X69,X62, X64);

xor U78 (D2,X81, X69);

xor U81 (X81,A2, B2);

and U83 (X83,X89, B2);

and U85 (X85,X87, X69);

not U87 (X87,X81);

not U89 (X89,A2);

or U90 (X90,X83, X85);

xor U99 (D3,X102, X90);

xor U102 (X102,A3, B4);

and U104 (X104,X110, B4);

and U106 (X106,X108, X90);

not U108 (X108,X102);

not U110 (X110,A3);

or U111 (X111,X104, X106);

xor U120 (D4,X123, X111);

xor U123 (X123,A4, B4);

and U125 (X125,X131, B4);

and U127 (X127,X129, X111);

not U129 (X129,X123);

not U131 (X131,A4);

or U132 (X132,X125, X127);

xor U141 (D5,X144, X132);

xor U144 (X144,A5, B5);

and U146 (X146,X152, B5);

and U148 (X148,X150, X132);

not U150 (X150,X144);

not U152 (X152,A5);

or U153 (X153,X146, X148);

xor U162 (D6,X165, X153);

xor U165 (X165,A6, B6);

and U167 (X167,X173, B6);

and U169 (X169,X171, X153);

not U171 (X171,X165);

not U173 (X173,A6);

or U174 (X174,X167, X169);

xor U183 (D7,X186, X174);

xor U186 (X186,A7, B7);

endmodule

