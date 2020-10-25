`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2020 02:47:21 PM
// Design Name: 
// Module Name: topmod
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


module top(
    input [7:0] A,
    //input [7:0] B,
    input clk,
    input en_b,
    input en_a,
    input [1:0] Op,
    //output Bin, // testing output
    //output [7:0] Q,  //output for rega
    //output [7:0] P, //output for regb
    //output [8:0] S, //output for adder
    //output [7:0] D, //output for subtractor
    //output [15:0] Mfinal, //output for multiplier
    //output [15:0] Sfinal, //filled zeroes for adder output
    //output [15:0] Dfinal, //filled zeroes for subtractor output
    //output [15:0] OpSelected, //chosen output for seven seg display
    //output [3:0] data_out, //  datat out output for seven seg mux
    output dp_out, // dp out output for seven seg mux
    output [3:0] anode, // anode output for seven seg mux
    output [6:0] seg // seven segment display combo
    );
wire enA, enB;
wire [7:0] Q;
wire [7:0] P;
PushButton_Debouncer PbA(
    .clk(clk),
    .PB(en_a),
    .PB_up(enA)
); 
PushButton_Debouncer PbB(
    .clk(clk),
    .PB(en_b),
    .PB_up(enB)
); 

RegA r1(
    .Q(Q),
    .A(A),
    .clk(clk),
    .en_a(enA)
); 

RegA r2(
    .Q(P),
    .A(A),
    .clk(clk),
    .en_a(enB)
);
//start of adder
wire [8:0] S;
wire [6:0] c; 

add1bit a0(
    .A(Q[0]),
    .B(P[0]),
    .Cin(1'b0),
    .Cout(c[0]),
    .S(S[0])
);

add1bit a1(
    .A(Q[1]),
    .B(P[1]),
    .Cin(c[0]),
    .Cout(c[1]),
    .S(S[1])
);

add1bit a2(
    .A(Q[2]),
    .B(P[2]),
    .Cin(c[1]),
    .Cout(c[2]),
    .S(S[2])
);

add1bit a3(
    .A(Q[3]),
    .B(P[3]),
    .Cin(c[2]),
    .Cout(c[3]),
    .S(S[3])
);

add1bit a4(
    .A(Q[4]),
    .B(P[4]),
    .Cin(c[3]),
    .Cout(c[4]),
    .S(S[4])
);

add1bit a5(
    .A(Q[5]),
    .B(P[5]),
    .Cin(c[4]),
    .Cout(c[5]),
    .S(S[5])
);

add1bit a6(
    .A(Q[6]),
    .B(P[6]),
    .Cin(c[5]),
    .Cout(c[6]),
    .S(S[6])
);

add1bit a7(
    .A(Q[7]),
    .B(P[7]),
    .Cin(c[6]),
    .Cout(S[8]),
    .S(S[7])
);
// end of adder
//start of subtractor
wire [7:0] D;
wire Firstborrow;
wire [6:0] b;
FirstB_in Bin0(
    .A(Q[0]),
    .B(P[0]),
    .D(D[0]),
    .Bout(Firstborrow)
);


sub1bit s1(
    .A(Q[1]),
    .B(P[1]),
    .Bin(Firstborrow),
    .D(D[1]),
    .Bout(b[1])
);

sub1bit s2(
    .A(Q[2]),
    .B(P[2]),
    .Bin(b[1]),
    .D(D[2]),
    .Bout(b[2])
);

sub1bit s3(
    .A(Q[3]),
    .B(P[3]),
    .Bin(b[2]),
    .D(D[3]),
    .Bout(b[3])
);

sub1bit s4(
    .A(Q[4]),
    .B(P[4]),
    .Bin(b[3]),
    .D(D[4]),
    .Bout(b[4])
);

sub1bit s5(
    .A(Q[5]),
    .B(P[5]),
    .Bin(b[4]),
    .D(D[5]),
    .Bout(b[5])
);

sub1bit s6(
    .A(Q[6]),
    .B(P[6]),
    .Bin(b[5]),
    .D(D[6]),
    .Bout(b[6])
);

sub1bit s7(
    .A(Q[7]),
    .B(P[7]),
    .Bin(b[6]),
    .D(D[7]),
    .Bout(1'b0)
);
//end of subtractor. need to account for negative
//start of multiplier
wire [15:0] Mfinal;
wire [7:0] m0; wire [7:0] m1; wire [7:0] m2; wire [7:0] m3; wire [7:0] m4; wire [7:0] m5; wire [7:0] m6; wire [7:0] m7;
//P[0] multiplies Q
multiply1bit p00(.A(Q[0]), .B(P[0]), .P(m0[0]));
multiply1bit p01(.A(Q[1]), .B(P[0]), .P(m0[1]));
multiply1bit p02(.A(Q[2]), .B(P[0]), .P(m0[2]));
multiply1bit p03(.A(Q[3]), .B(P[0]), .P(m0[3]));
multiply1bit p04(.A(Q[4]), .B(P[0]), .P(m0[4]));
multiply1bit p05(.A(Q[5]), .B(P[0]), .P(m0[5]));
multiply1bit p06(.A(Q[6]), .B(P[0]), .P(m0[6]));
multiply1bit p07(.A(Q[7]), .B(P[0]), .P(m0[7]));
//P[1] multiplies Q
multiply1bit p10(.A(Q[0]), .B(P[1]), .P(m1[0]));
multiply1bit p11(.A(Q[1]), .B(P[1]), .P(m1[1]));
multiply1bit p12(.A(Q[2]), .B(P[1]), .P(m1[2]));
multiply1bit p13(.A(Q[3]), .B(P[1]), .P(m1[3]));
multiply1bit p14(.A(Q[4]), .B(P[1]), .P(m1[4]));
multiply1bit p15(.A(Q[5]), .B(P[1]), .P(m1[5]));
multiply1bit p16(.A(Q[6]), .B(P[1]), .P(m1[6]));
multiply1bit p17(.A(Q[7]), .B(P[1]), .P(m1[7]));
//P[2] multiplies Q
multiply1bit p20(.A(Q[0]), .B(P[2]), .P(m2[0]));
multiply1bit p21(.A(Q[1]), .B(P[2]), .P(m2[1]));
multiply1bit p22(.A(Q[2]), .B(P[2]), .P(m2[2]));
multiply1bit p23(.A(Q[3]), .B(P[2]), .P(m2[3]));
multiply1bit p24(.A(Q[4]), .B(P[2]), .P(m2[4]));
multiply1bit p25(.A(Q[5]), .B(P[2]), .P(m2[5]));
multiply1bit p26(.A(Q[6]), .B(P[2]), .P(m2[6]));
multiply1bit p27(.A(Q[7]), .B(P[2]), .P(m2[7]));
//P[3] multiplies Q
multiply1bit p30(.A(Q[0]), .B(P[3]), .P(m3[0]));
multiply1bit p31(.A(Q[1]), .B(P[3]), .P(m3[1]));
multiply1bit p32(.A(Q[2]), .B(P[3]), .P(m3[2]));
multiply1bit p33(.A(Q[3]), .B(P[3]), .P(m3[3]));
multiply1bit p34(.A(Q[4]), .B(P[3]), .P(m3[4]));
multiply1bit p35(.A(Q[5]), .B(P[3]), .P(m3[5]));
multiply1bit p36(.A(Q[6]), .B(P[3]), .P(m3[6]));
multiply1bit p37(.A(Q[7]), .B(P[3]), .P(m3[7]));
//P[4] multiplies Q
multiply1bit p40(.A(Q[0]), .B(P[4]), .P(m4[0]));
multiply1bit p41(.A(Q[1]), .B(P[4]), .P(m4[1]));
multiply1bit p42(.A(Q[2]), .B(P[4]), .P(m4[2]));
multiply1bit p43(.A(Q[3]), .B(P[4]), .P(m4[3]));
multiply1bit p44(.A(Q[4]), .B(P[4]), .P(m4[4]));
multiply1bit p45(.A(Q[5]), .B(P[4]), .P(m4[5]));
multiply1bit p46(.A(Q[6]), .B(P[4]), .P(m4[6]));
multiply1bit p47(.A(Q[7]), .B(P[4]), .P(m4[7]));
//P[5] multiplies Q
multiply1bit p50(.A(Q[0]), .B(P[5]), .P(m5[0]));
multiply1bit p51(.A(Q[1]), .B(P[5]), .P(m5[1]));
multiply1bit p52(.A(Q[2]), .B(P[5]), .P(m5[2]));
multiply1bit p53(.A(Q[3]), .B(P[5]), .P(m5[3]));
multiply1bit p54(.A(Q[4]), .B(P[5]), .P(m5[4]));
multiply1bit p55(.A(Q[5]), .B(P[5]), .P(m5[5]));
multiply1bit p56(.A(Q[6]), .B(P[5]), .P(m5[6]));
multiply1bit p57(.A(Q[7]), .B(P[5]), .P(m5[7]));
//P[6] multiplies Q
multiply1bit p60(.A(Q[0]), .B(P[6]), .P(m6[0]));
multiply1bit p61(.A(Q[1]), .B(P[6]), .P(m6[1]));
multiply1bit p62(.A(Q[2]), .B(P[6]), .P(m6[2]));
multiply1bit p63(.A(Q[3]), .B(P[6]), .P(m6[3]));
multiply1bit p64(.A(Q[4]), .B(P[6]), .P(m6[4]));
multiply1bit p65(.A(Q[5]), .B(P[6]), .P(m6[5]));
multiply1bit p66(.A(Q[6]), .B(P[6]), .P(m6[6]));
multiply1bit p67(.A(Q[7]), .B(P[6]), .P(m6[7]));
//P[7] multiplies Q
multiply1bit p70(.A(Q[0]), .B(P[7]), .P(m7[0]));
multiply1bit p71(.A(Q[1]), .B(P[7]), .P(m7[1]));
multiply1bit p72(.A(Q[2]), .B(P[7]), .P(m7[2]));
multiply1bit p73(.A(Q[3]), .B(P[7]), .P(m7[3]));
multiply1bit p74(.A(Q[4]), .B(P[7]), .P(m7[4]));
multiply1bit p75(.A(Q[5]), .B(P[7]), .P(m7[5]));
multiply1bit p76(.A(Q[6]), .B(P[7]), .P(m7[6]));
multiply1bit p77(.A(Q[7]), .B(P[7]), .P(m7[7]));
//addition part of the the multiplier. sums will fill [15:0] M
wire [9:0] mp0; wire [10:0] mp1; wire [11:0] mp2; wire [12:0] mp3; wire [13:0] mp4; wire [14:0] mp5; //mini products
wire [6:0] c0; wire [6:0] c1; wire [6:0] c2; wire [6:0] c3; wire [6:0] c4; wire [6:0] c5; wire [6:0] c6; 
//adding m0 and m1
add1bit ms00(.A(m0[0]), .B(1'b0), .Cin(1'b0), .Cout(1'b0), .S(mp0[0]));
add1bit ms01(.A(m0[1]), .B(m1[0]), .Cin(1'b0), .Cout(c0[0]), .S(mp0[1]));
add1bit ms02(.A(m0[2]), .B(m1[1]), .Cin(c0[0]), .Cout(c0[1]), .S(mp0[2]));
add1bit ms03(.A(m0[3]), .B(m1[2]), .Cin(c0[1]), .Cout(c0[2]), .S(mp0[3]));
add1bit ms04(.A(m0[4]), .B(m1[3]), .Cin(c0[2]), .Cout(c0[3]), .S(mp0[4]));
add1bit ms05(.A(m0[5]), .B(m1[4]), .Cin(c0[3]), .Cout(c0[4]), .S(mp0[5]));
add1bit ms06(.A(m0[6]), .B(m1[5]), .Cin(c0[4]), .Cout(c0[5]), .S(mp0[6]));
add1bit ms07(.A(m0[7]), .B(m1[6]), .Cin(c0[5]), .Cout(c0[6]), .S(mp0[7]));
add1bit ms08(.A(1'b0), .B(m1[7]), .Cin(c0[6]), .Cout(mp0[9]), .S(mp0[8]));
//adding mp0 and m2
add1bit ms10(.A(mp0[0]), .B(1'b0), .Cin(1'b0), .Cout(1'b0), .S(mp1[0]));
add1bit ms11(.A(mp0[1]), .B(1'b0), .Cin(1'b0), .Cout(1'b0), .S(mp1[1]));
add1bit ms12(.A(mp0[2]), .B(m2[0]), .Cin(1'b0), .Cout(c1[0]), .S(mp1[2]));
add1bit ms13(.A(mp0[3]), .B(m2[1]), .Cin(c1[0]), .Cout(c1[1]), .S(mp1[3]));
add1bit ms14(.A(mp0[4]), .B(m2[2]), .Cin(c1[1]), .Cout(c1[2]), .S(mp1[4]));
add1bit ms15(.A(mp0[5]), .B(m2[3]), .Cin(c1[2]), .Cout(c1[3]), .S(mp1[5]));
add1bit ms16(.A(mp0[6]), .B(m2[4]), .Cin(c1[3]), .Cout(c1[4]), .S(mp1[6]));
add1bit ms17(.A(mp0[7]), .B(m2[5]), .Cin(c1[4]), .Cout(c1[5]), .S(mp1[7]));
add1bit ms18(.A(mp0[8]), .B(m2[6]), .Cin(c1[5]), .Cout(c1[6]), .S(mp1[8]));
add1bit ms19(.A(mp0[9]), .B(m2[7]), .Cin(c1[6]), .Cout(mp1[10]), .S(mp1[9]));
//adding mp1 and m3
add1bit ms20(.A(mp1[0]), .B(1'b0), .Cin(1'b0), .Cout(1'b0), .S(mp2[0]));
add1bit ms21(.A(mp1[1]), .B(1'b0), .Cin(1'b0), .Cout(1'b0), .S(mp2[1]));
add1bit ms22(.A(mp1[2]), .B(1'b0), .Cin(1'b0), .Cout(1'b0), .S(mp2[2]));
add1bit ms23(.A(mp1[3]), .B(m3[0]), .Cin(1'b0), .Cout(c2[0]), .S(mp2[3]));
add1bit ms24(.A(mp1[4]), .B(m3[1]), .Cin(c2[0]), .Cout(c2[1]), .S(mp2[4]));
add1bit ms25(.A(mp1[5]), .B(m3[2]), .Cin(c2[1]), .Cout(c2[2]), .S(mp2[5]));
add1bit ms26(.A(mp1[6]), .B(m3[3]), .Cin(c2[2]), .Cout(c2[3]), .S(mp2[6]));
add1bit ms27(.A(mp1[7]), .B(m3[4]), .Cin(c2[3]), .Cout(c2[4]), .S(mp2[7]));
add1bit ms28(.A(mp1[8]), .B(m3[5]), .Cin(c2[4]), .Cout(c2[5]), .S(mp2[8]));
add1bit ms29(.A(mp1[9]), .B(m3[6]), .Cin(c2[5]), .Cout(c2[6]), .S(mp2[9]));
add1bit ms210(.A(mp1[10]), .B(m3[7]), .Cin(c2[6]), .Cout(mp2[11]), .S(mp2[10]));
//adding mp2 and m4
add1bit ms30(.A(mp2[0]), .B(1'b0), .Cin(1'b0), .Cout(1'b0), .S(mp3[0]));
add1bit ms31(.A(mp2[1]), .B(1'b0), .Cin(1'b0), .Cout(1'b0), .S(mp3[1]));
add1bit ms32(.A(mp2[2]), .B(1'b0), .Cin(1'b0), .Cout(1'b0), .S(mp3[2]));
add1bit ms33(.A(mp2[3]), .B(1'b0), .Cin(1'b0), .Cout(1'b0), .S(mp3[3]));
add1bit ms34(.A(mp2[4]), .B(m4[0]), .Cin(1'b0), .Cout(c3[0]), .S(mp3[4]));
add1bit ms35(.A(mp2[5]), .B(m4[1]), .Cin(c3[0]), .Cout(c3[1]), .S(mp3[5]));
add1bit ms36(.A(mp2[6]), .B(m4[2]), .Cin(c3[1]), .Cout(c3[2]), .S(mp3[6]));
add1bit ms37(.A(mp2[7]), .B(m4[3]), .Cin(c3[2]), .Cout(c3[3]), .S(mp3[7]));
add1bit ms38(.A(mp2[8]), .B(m4[4]), .Cin(c3[3]), .Cout(c3[4]), .S(mp3[8]));
add1bit ms39(.A(mp2[9]), .B(m4[5]), .Cin(c3[4]), .Cout(c3[5]), .S(mp3[9]));
add1bit ms310(.A(mp2[10]), .B(m4[6]), .Cin(c3[5]), .Cout(c3[6]), .S(mp3[10]));
add1bit ms311(.A(mp2[11]), .B(m4[7]), .Cin(c3[6]), .Cout(mp3[12]), .S(mp3[11]));
//adding mp3 and m5
add1bit ms40(.A(mp3[0]), .B(1'b0), .Cin(1'b0), .Cout(1'b0), .S(mp4[0]));
add1bit ms41(.A(mp3[1]), .B(1'b0), .Cin(1'b0), .Cout(1'b0), .S(mp4[1]));
add1bit ms42(.A(mp3[2]), .B(1'b0), .Cin(1'b0), .Cout(1'b0), .S(mp4[2]));
add1bit ms43(.A(mp3[3]), .B(1'b0), .Cin(1'b0), .Cout(1'b0), .S(mp4[3]));
add1bit ms44(.A(mp3[4]), .B(1'b0), .Cin(1'b0), .Cout(1'b0), .S(mp4[4]));
add1bit ms45(.A(mp3[5]), .B(m5[0]), .Cin(1'b0), .Cout(c4[0]), .S(mp4[5]));
add1bit ms46(.A(mp3[6]), .B(m5[1]), .Cin(c4[0]), .Cout(c4[1]), .S(mp4[6]));
add1bit ms47(.A(mp3[7]), .B(m5[2]), .Cin(c4[1]), .Cout(c4[2]), .S(mp4[7]));
add1bit ms48(.A(mp3[8]), .B(m5[3]), .Cin(c4[2]), .Cout(c4[3]), .S(mp4[8]));
add1bit ms49(.A(mp3[9]), .B(m5[4]), .Cin(c4[3]), .Cout(c4[4]), .S(mp4[9]));
add1bit ms410(.A(mp3[10]), .B(m5[5]), .Cin(c4[4]), .Cout(c4[5]), .S(mp4[10]));
add1bit ms411(.A(mp3[11]), .B(m5[6]), .Cin(c4[5]), .Cout(c4[6]), .S(mp4[11]));
add1bit ms412(.A(mp3[12]), .B(m5[7]), .Cin(c4[6]), .Cout(mp4[13]), .S(mp4[12]));
//adding mp4 and m6
add1bit ms50(.A(mp4[0]), .B(1'b0), .Cin(1'b0), .Cout(1'b0), .S(mp5[0]));
add1bit ms51(.A(mp4[1]), .B(1'b0), .Cin(1'b0), .Cout(1'b0), .S(mp5[1]));
add1bit ms52(.A(mp4[2]), .B(1'b0), .Cin(1'b0), .Cout(1'b0), .S(mp5[2]));
add1bit ms53(.A(mp4[3]), .B(1'b0), .Cin(1'b0), .Cout(1'b0), .S(mp5[3]));
add1bit ms54(.A(mp4[4]), .B(1'b0), .Cin(1'b0), .Cout(1'b0), .S(mp5[4]));
add1bit ms55(.A(mp4[5]), .B(1'b0), .Cin(1'b0), .Cout(1'b0), .S(mp5[5]));
add1bit ms56(.A(mp4[6]), .B(m6[0]), .Cin(1'b0), .Cout(c5[0]), .S(mp5[6]));
add1bit ms57(.A(mp4[7]), .B(m6[1]), .Cin(c5[0]), .Cout(c5[1]), .S(mp5[7]));
add1bit ms58(.A(mp4[8]), .B(m6[2]), .Cin(c5[1]), .Cout(c5[2]), .S(mp5[8]));
add1bit ms59(.A(mp4[9]), .B(m6[3]), .Cin(c5[2]), .Cout(c5[3]), .S(mp5[9]));
add1bit ms510(.A(mp4[10]), .B(m6[4]), .Cin(c5[3]), .Cout(c5[4]), .S(mp5[10]));
add1bit ms511(.A(mp4[11]), .B(m6[5]), .Cin(c5[4]), .Cout(c5[5]), .S(mp5[11]));
add1bit ms512(.A(mp4[12]), .B(m6[6]), .Cin(c5[5]), .Cout(c5[6]), .S(mp5[12]));
add1bit ms513(.A(mp4[13]), .B(m6[7]), .Cin(c5[6]), .Cout(mp5[14]), .S(mp5[13]));
//adding mp5 and m7 with final product
add1bit ms60(.A(mp5[0]), .B(1'b0), .Cin(1'b0), .Cout(1'b0), .S(Mfinal[0]));
add1bit ms61(.A(mp5[1]), .B(1'b0), .Cin(1'b0), .Cout(1'b0), .S(Mfinal[1]));
add1bit ms62(.A(mp5[2]), .B(1'b0), .Cin(1'b0), .Cout(1'b0), .S(Mfinal[2]));
add1bit ms63(.A(mp5[3]), .B(1'b0), .Cin(1'b0), .Cout(1'b0), .S(Mfinal[3]));
add1bit ms64(.A(mp5[4]), .B(1'b0), .Cin(1'b0), .Cout(1'b0), .S(Mfinal[4]));
add1bit ms65(.A(mp5[5]), .B(1'b0), .Cin(1'b0), .Cout(1'b0), .S(Mfinal[5]));
add1bit ms66(.A(mp5[6]), .B(1'b0), .Cin(1'b0), .Cout(1'b0), .S(Mfinal[6]));
add1bit ms67(.A(mp5[7]), .B(m7[0]), .Cin(1'b0), .Cout(c6[0]), .S(Mfinal[7]));
add1bit ms68(.A(mp5[8]), .B(m7[1]), .Cin(c6[0]), .Cout(c6[1]), .S(Mfinal[8]));
add1bit ms69(.A(mp5[9]), .B(m7[2]), .Cin(c6[1]), .Cout(c6[2]), .S(Mfinal[9]));
add1bit ms610(.A(mp5[10]), .B(m7[3]), .Cin(c6[2]), .Cout(c6[3]), .S(Mfinal[10]));
add1bit ms611(.A(mp5[11]), .B(m7[4]), .Cin(c6[3]), .Cout(c6[4]), .S(Mfinal[11]));
add1bit ms612(.A(mp5[12]), .B(m7[5]), .Cin(c6[4]), .Cout(c6[5]), .S(Mfinal[12]));
add1bit ms613(.A(mp5[13]), .B(m7[6]), .Cin(c6[5]), .Cout(c6[6]), .S(Mfinal[13]));
add1bit ms614(.A(mp5[14]), .B(m7[7]), .Cin(c6[6]), .Cout(Mfinal[15]), .S(Mfinal[14]));
//filling 16 bit final outputs. filling sfinal
wire [15:0] Sfinal;
buf bs0(Sfinal[0], S[0]);
buf bs1(Sfinal[1], S[1]);
buf bs2(Sfinal[2], S[2]);
buf bs3(Sfinal[3], S[3]);
buf bs4(Sfinal[4], S[4]);
buf bs5(Sfinal[5], S[5]);
buf bs6(Sfinal[6], S[6]);
buf bs7(Sfinal[7], S[7]);
buf bs8(Sfinal[8], S[8]);
buf bs9(Sfinal[9], 1'b0);
buf bs10(Sfinal[10], 1'b0);
buf bs11(Sfinal[11], 1'b0);
buf bs12(Sfinal[12], 1'b0);
buf bs13(Sfinal[13], 1'b0);
buf bs14(Sfinal[14], 1'b0);
buf bs15(Sfinal[15], 1'b0);
//filling dfinal
wire [15:0] Dfinal;
buf bd0(Dfinal[0], D[0]);
buf bd1(Dfinal[1], D[1]);
buf bd2(Dfinal[2], D[2]);
buf bd3(Dfinal[3], D[3]);
buf bd4(Dfinal[4], D[4]);
buf bd5(Dfinal[5], D[5]);
buf bd6(Dfinal[6], D[6]);
buf bd7(Dfinal[7], D[7]);
buf bd8(Dfinal[8], 1'b0);
buf bd9(Dfinal[9], 1'b0);
buf bd10(Dfinal[10], 1'b0);
buf bd11(Dfinal[11], 1'b0);
buf bd12(Dfinal[12], 1'b0);
buf bd13(Dfinal[13], 1'b0);
buf bd14(Dfinal[14], 1'b0);
buf bd15(Dfinal[15], 1'b0);
// selecting output
wire [15:0] OpSelected;
mux4 sel0(
    .in0(1'b0),
    .in1(Sfinal[15:0]),
    .in2(Dfinal[15:0]),
    .in3(Mfinal[15:0]),
    .sel(Op[1:0]),
    .out(OpSelected[15:0])
);
//display mux
wire [3:0] data_wire;  
seven_segment_mux dis(
    .clk(clk),
    .leftmost(OpSelected[15:12]),
    .left_center(OpSelected[11:8]),
    .right_center(OpSelected[7:4]),
    .rightmost(OpSelected[3:0]),
    .leftmost_dp(1'b0),
    .left_center_dp(1'b0),
    .right_center_dp(1'b0),
    .rightmost_dp(1'b0),
    .dp_out(dp_out),
    .data_out(data_wire[3:0]),
    .anode(anode)
);
//A
mux #(16,1) U0 (
	.data_out(seg[0]),
	.select_in( {data_wire[3],data_wire[2],data_wire[1],data_wire[0]} ),
	.data_in( {1'b0,1'b0,1'b1,1'b0,1'b1,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b1,1'b0} )
);
//B
mux #(16,1) U1 (
	.data_out(seg[1]),
	.select_in( {data_wire[3],data_wire[2],data_wire[1],data_wire[0]} ),
	.data_in( {1'b1,1'b1,1'b0,1'b1,1'b1,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0,1'b0,1'b0,1'b0,1'b0} )
);
//C
mux #(16,1) U2 (
	.data_out(seg[2]),
	.select_in( {data_wire[3],data_wire[2],data_wire[1],data_wire[0]} ),
	.data_in( {1'b1,1'b1,1'b0,1'b1,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b0} )
);
//D
mux #(16,1) U3 (
	.data_out(seg[3]),
	.select_in( {data_wire[3],data_wire[2],data_wire[1],data_wire[0]} ),
	.data_in( {1'b1,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b1,1'b0,1'b0,1'b1,1'b0,1'b0,1'b1,1'b0} )
);
//E
mux #(16,1) U4 (
	.data_out(seg[4]),
	.select_in( {data_wire[3],data_wire[2],data_wire[1],data_wire[0]} ),
	.data_in( {1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1,1'b1,1'b1,1'b0,1'b1,1'b0} )
);
//F
mux #(16,1) U5 (
	.data_out(seg[5]),
	.select_in( {data_wire[3],data_wire[2],data_wire[1],data_wire[0]} ),
	.data_in( {1'b0,1'b0,1'b1,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b0} )
);
//G
mux #(16,1) U6 (
	.data_out(seg[6]),
	.select_in( {data_wire[3],data_wire[2],data_wire[1],data_wire[0]} ),
	.data_in( {1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1} )
);

endmodule












