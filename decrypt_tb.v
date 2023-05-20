`timescale 1ns/100ps
module decrypt_tb;
reg [63:0] in;
reg [127:0] key;
wire [63:0] out1;

decrypt dnc(
.in(in),
.out(out1),
.key(key));


initial begin
    #10
    in=64'b1100011011011110110110110111000011100101000101101101111111000101;
    key=1;
    #100
    $display("in      is %b",in);
    $display("output is %b",out1);
    #300
    $finish;
end
endmodule

// `timescale 1ns/100ps
// module decrypt_tb;
// reg [63:0] in;
// reg [127:0] key;
// wire [63:0] round1,round2,round3,round4,round5,round6,round7,round8,out;
// wire [127:0] key1,key2,key3,key4,key5,key6,key7,key8;
// assign key6 = key << 25 | key >> 103;
// assign key5 = key6 << 25 | key6 >> 103;
// assign key4 = key5 << 25 | key5 >> 103;
// assign key3 = key4 << 25 | key4 >> 103;
// assign key2 = key3 << 25 | key3 >> 103;
// assign key1 = key2 << 25 | key2 >> 103; 
// round r1(.in(in),.key({inv_mod(key1[7*16+15:7*16]),inv_plus(key1[6*16+15:6*16]),inv_plus(key1[5*16+15:5*16]),inv_mod(key1[4*16+15:4*16]),key2[1*16+15:0*16]}),.out(round1));//2:4  new key:org key
// round r2(.in(round1),.key({inv_mod(key2[5*16+15:5*16]),inv_plus(key2[3*16+15:3*16]),inv_plus(key2[4*16+15:4*16]),inv_mod(key2[2*16+15:2*16]),key2[7*16+15:6*16]}),.out(round2)); 
// round r3(.in(round2),.key({inv_mod(key3[3*16+15:3*16]),inv_plus(key3[1*16+15:1*16]),inv_plus(key3[2*16+15:2*16]),inv_mod (key3[0*16+15:0*16]),key3[5*16+15:4*16]}),.out(round3)); 
// round r4(.in(round3),.key({inv_mod(key4[1*16+15:1*16]),inv_plus(key3[7*16+15:7*16]),inv_plus(key4[0*16+15:0*16]),inv_mod(key3[6*16+15:6*16]),key4[3*16+15:2*16]}),.out(round4)); 
// round r5(.in(round4),.key({inv_mod(key4[7*16+15:7*16]),inv_plus(key4[5*16+15:5*16]),inv_plus(key4[6*16+15:6*16]),inv_mod(key4[4*16+15:4*16]),key5[1*16+15:0*16]}),.out(round5)); 
// round r6(.in(round5),.key({inv_mod(key5[5*16+15:5*16]),inv_plus(key5[3*16+15:3*16]),inv_plus(key5[4*16+15:4*16]),inv_mod(key5[2*16+15:2*16]),key5[7*16+15:6*16]}),.out(round6)); 
// round r7(.in(round6),.key({inv_mod(key6[3*16+15:3*16]),inv_plus(key6[1*16+15:1*16]),inv_plus(key6[2*16+15:2*16]),inv_mod(key6[0*16+15:0*16]),key6[5*16+15:4*16]}),.out(round7)); 
// round r8(.in(round7),.key({inv_mod(key[1*16+15:1*16]),inv_plus(key6[7*16+15:7*16]),inv_plus(key[0*16+15:0*16]),inv_mod(key6[6*16+15:6*16]),key[3*16+15:2*16]}),.out(round8)); 
// assign out={mul(round8[3*16+15:3*16],(inv_mod(key[7*16+15:7*16]))),round8[1*16+15:1*16]+(inv_plus(key[6*16+15:6*16])),round8[2*16+15:2*16]+(inv_plus(key[5*16+15:5*16])),mul(round8[0*16+15:0*16],(inv_mod(key[4*16+15:4*16])))};
// initial begin
//     key=1;
//     #10
//     in=64'b1100011011011110110110110111000011100101000101101101111111000101;
//     #100
//     $display("in     is %b",in); 
//     $display("round0 is %b",round1);
//     $display("round1 is %b",round2);
//     $display("round2 is %b",round3);
//     $display("round3 is %b",round4);
//     $display("round4 is %b",round5);
//     $display("round5 is %b",round6);
//     $display("round6 is %b",round7);
//     $display("round7 is %b",round8);
//     $display("out    is %b",out);
//     // $display("output2 is %b",out2);
//     #300
//     $finish;
// end
// function [15:0] inv_plus ;
//     input     [15:0] in ;
//     begin
//         inv_plus=~in+1;
//     end
// endfunction
// function [15:0] inv_mod ;
//     input [15:0] in ;
//     reg [16:0] b; 
//     reg [100:0] a; 
//     begin
//         b=65535;
//         inv_mod=1;
//         a=in;
//         a = (a % 65537 + 65537) % 65537;
//         while (b) begin
//             if (b&1) inv_mod = (a * inv_mod) % 65537;
//             a = (a * a) % 65537;
//             b=b>>1;
//         end
//     end
// endfunction
// endmodule

