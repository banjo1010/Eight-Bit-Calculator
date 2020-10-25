`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2020 09:57:52 PM
// Design Name: 
// Module Name: add1bit
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


module add1bit(
    input A, B,
    input Cin,
    output Cout, S
);
    
    wire A1, A2, A3;
    xor a1(A1, A, B);
    and a2(A2, A, B);
    and a3(A3, A1, Cin);
    or a4(Cout, A2, A3);
    xor a5(S, A1, Cin);
    
    
endmodule
