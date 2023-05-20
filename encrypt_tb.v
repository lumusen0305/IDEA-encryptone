`timescale 1ns/100ps
module encrypt_tb;
reg [63:0] in;
reg [127:0] key;
wire [63:0] out1;
// wire [63:0] out2;

encrypt enc(
.in(in),
.out(out1),
.key(key));


initial begin
    #10
    // in=64';
    in=3;
    key=1;
    #100
    $display("in      is %b",in);
    $display("output1 is %b",out1);
    // $display("output2 is %b",out2);
    #300
    $finish;
end
endmodule

// 0000000000000000001000110110001111110100000001000000000000000000
// `timescale 1ns/100ps
// module encrypt_tb;
// reg [63:0] in;
// reg [127:0] key;

// wire [63:0] round1,round2,round3,round4,round5,round6,round7,round8,out;
// wire [127:0] key1,key2,key3,key4,key5,key6,key7,key8;
// assign key1=key;
// //Big round 1
// round r0(.in(in),.key(key[7*16+15:2*16]),.out(round1));//6:0  new key:org key

// assign key2=key1<<<25;
// round r1(.in(round1),.key({key[1*16+15:0*16],key2[7*16+15:4*16]}),.out(round2)); //4:2
// assign key3=key2<<<25;
// round r2(.in(round2),.key({key2[3*16+15:0*16],key3[7*16+15:6*16]}),.out(round3)); //2:4

// round r3(.in(round3),.key(key3[5*16+15:0*16]),.out(round4)); //0:6

// //Big round 2
// assign key4=key3<<<25;

// round r4(.in(round4),.key(key4[7*16+15:2*16]),.out(round5));//6:0

// assign key5=key4<<<25;
// round r5(.in(round5),.key({key4[1*16+15:0*16],key5[7*16+15:4*16]}),.out(round6)); //4:2

// assign key6=key5<<<25;
// round r6(.in(round6),.key({key5[3*16+15:0*16],key6[7*16+15:6*16]}),.out(round7)); //2:4

// assign key7=key6<<<25;
// round r7(.in(round7),.key(key6[5*16+15:0*16]),.out(round8)); //0:6


// initial begin
//     #10
//     // in=64';
//     in=3;
//     key=1;
//     #100
//     $display("in      is %b",in);
//     $display("round0 is %b",round1);
//     $display("round1 is %b",round2);
//     $display("round2 is %b",round3);
//     $display("round3 is %b",round4);
//     $display("round4 is %b",round5);
//     $display("round5 is %b",round6);
//     $display("round6 is %b",round7);
//     $display("round7 is %b",round8);
//     // $display("out    is %b",out);
//     // $display("output2 is %b",out2);
//     #300
//     $finish;
// end
// endmodule
// // 0000000000000000001000110110001111110100000001000000000000000000
// 0000000000000000
// 000000000001001011111111111101010000000000000000

// 0000000000010011
// 1111111111110101
// 0000000000010010
// 0000000000001001