module decrypt(in,key,out);
    input [63:0] in;
    input [127:0] key;
    output [63:0] out;
    wire [63:0] round1,round2,round3,round4,round5,round6,round7,round8;
    wire [127:0] key1,key2,key3,key4,key5,key6,key7,key8;

    //Big round 1
    assign key1=key>>>25*7;
    assign key2=key1<<<25;
    round r1(.in(in),.key({~key2[6*16+15:5*16],~key1[3*16+15:0*16]}),.out(round1));//2:4  new key:org key

    assign key3=key2<<<25;
    round r2(.in(round1),.key({~key3[6*16+15:5*16],~key2[7*16+15:6*16]}),.out(round2)); //4:2

    assign key4=key3<<<25;
    round r3(.in(round2),.key({~key4[6*16+15:5*16],~key3[7*16+15:6*16]}),.out(round3)); //4:2

    assign key5=key4<<<25;
    round r4(.in(round3),.key({~key5[6*16+15:5*16],~key4[7*16+15:6*16]}),.out(round4)); //0:6
    
    //Big round 2
    assign key6=key5<<<25;
    round r5(.in(round4),.key({~key6[6*16+15:5*16],~key5[7*16+15:6*16]}),.out(round5)); //6:0

    assign key7=key6<<<25;
    round r6(.in(round5),.key({~key7[6*16+15:5*16],~key6[7*16+15:6*16]}),.out(round6)); //4:2

    assign key8=key7<<<25;
    round r7(.in(round6),.key({~key8[6*16+15:5*16],~key7[7*16+15:6*16]}),.out(round7)); //2:4

    round r8(.in(round3),.key({~key3[6*16+15:5*16],~key8[7*16+15:6*16]}),.out(round8)); //0:6

    assign out={round8[3*16+15:3*16]*(~key8[3*16+15:3*16]),round8[2*16+15:2*16]+(~key8[2*16+15:2*16]),round8[1*16+15:1*16]+(~key8[1*16+15:1*16]),round8[0*16+15:0*16]*(~key8[0*16+15:0*16])};
endmodule