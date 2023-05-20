module encrypt(in,key,out);
    input [63:0] in;
    input [127:0] key;
    output [63:0] out;
    wire [63:0] round1,round2,round3,round4,round5,round6,round7,round8;
    wire [127:0] key1,key2,key3,key4,key5,key6,key7;
    assign key1=key;
    //Big round 1
    round r0(.in(in),.key(key[7*16+15:2*16]),.out(round1));//6:0  new key:org key

    assign key2=key1<<<25;
    round r1(.in(round1),.key({key[1*16+15:0*16],key2[7*16+15:4*16]}),.out(round2)); //4:2
    assign key3=key2<<<25;
    round r2(.in(round2),.key({key2[3*16+15:0*16],key3[7*16+15:6*16]}),.out(round3)); //2:4

    round r3(.in(round3),.key(key3[5*16+15:0*16]),.out(round4)); //0:6
    
    //Big round 2
    assign key4=key3<<<25;

    round r4(.in(round4),.key(key4[7*16+15:2*16]),.out(round5));//6:0

    assign key5=key4<<<25;
    round r5(.in(round5),.key({key4[1*16+15:0*16],key5[7*16+15:4*16]}),.out(round6)); //4:2
    
    assign key6=key5<<<25;
    round r6(.in(round6),.key({key5[3*16+15:0*16],key6[7*16+15:6*16]}),.out(round7)); //2:4

    assign key7=key6<<<25;
    round r7(.in(round7),.key(key6[5*16+15:0*16]),.out(round8)); //0:6
    assign out={mul(round8[3*16+15:3*16],key7[7*16+15:7*16]),round8[1*16+15:1*16]+key7[6*16+15:6*16],round8[2*16+15:2*16]+key7[5*16+15:5*16],mul(round8[0*16+15:0*16],key7[4*16+15:4*16])};
    function [15:0]     mul ;
        input     [15:0] a ;
        input     [15:0] b ;
        reg [35:0]  temp;
        begin
            if (a==0) begin
                if (b==0) begin
                    temp=1;
                end
                else begin
                    temp=65536*b;
                end
            end
            else begin
                if (b==0) begin
                    temp=a*65536;
                end
                else begin
                    temp=a*b;
                end
            end
            temp=temp%65537;
            if(temp==65536)begin
                mul=0;
            end
            else begin
                mul=temp;
            end
        end
    endfunction
    
endmodule

