`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2020 03:55:46 PM
// Design Name: 
// Module Name: dff_en
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


module dff_en(
    input in_D, in_EN, in_CLK,
    output reg data_out
);
always @ (posedge in_CLK)
    if(in_EN)
        data_out<=in_D;
endmodule


