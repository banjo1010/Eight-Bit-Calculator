`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/07/2020 06:16:40 PM
// Design Name: 
// Module Name: mux
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


module mux
#(parameter NUM_INPUTS = 2, parameter NUM_OUTPUTS = 1)
(
input [(NUM_INPUTS-1):0] data_in,
input [$clog2(NUM_INPUTS)-1:0] select_in,
output data_out
);
reg [NUM_INPUTS:0] D;
always @ (D)
begin
D <= data_in;
end
assign data_out = D[select_in];
endmodule
