`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/03/2020 01:29:02 AM
// Design Name: 
// Module Name: adder
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


module adder(
	input A0,
	input B0,
	input A1,
	input B1,
	input A2,
	input B2,
	input A3,
	input B3,
	input A4,
	input B4,
	input A5,
	input B5,
	input A6,
	input B6,
	input A7,
	input B7,
	output S0,
	output S1,
	output S2,
	output S3,
	output S4,
	output S5,
	output S6,
	output S7,
	output C
);

wire X3, X12, X14, X15, X16, X39, X43, X45, X46, X56, X60, X62, X63, X73, X77, X79, X80, X90, X94, X96, X97, X107, X111, X113, X114, X124, X128, X130;


and U3 (X3,A0, B0);

xor U2 (S0,A0, B0);

xor U12 (X12,A1, B1);

xor U13 (S1,X12, X3);

and U14 (X14,X12, X3);

and U15 (X15,A1, B1);

or U16 (X16,X15, X14);

xor U39 (X39,A2, B2);

xor U41 (S2,X39, X16);

and U43 (X43,X39, X16);

and U45 (X45,A2, B2);

or U46 (X46,X43, X45);

xor U56 (X56,A3, B3);

xor U58 (S3,X56, X46);

and U60 (X60,X56, X46);

and U62 (X62,A3, B3);

or U63 (X63,X60, X62);

xor U73 (X73,A4, B4);

xor U75 (S4,X73, X63);

and U77 (X77,X73, X63);

and U79 (X79,A4, B4);

or U80 (X80,X77, X79);

xor U90 (X90,A5, B5);

xor U92 (S5,X90, X80);

and U94 (X94,X90, X80);

and U96 (X96,A5, B5);

or U97 (X97,X94, X96);

xor U107 (X107,A6, B6);

xor U109 (S6,X107, X97);

and U111 (X111,X107, X97);

and U113 (X113,A6, B6);

or U114 (X114,X111, X113);

xor U124 (X124,A7, B7);

xor U126 (S7,X124, X114);

and U128 (X128,X124, X114);

and U130 (X130,A7, B7);

or U131 (C,X128, X130);

endmodule

