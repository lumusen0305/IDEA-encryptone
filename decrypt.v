module decrypt(in,key,out);
    input [63:0] in;
    input [127:0] key;
    output [63:0] out;
    wire [63:0] round1,round2,round3,round4,round5,round6,round7,round8;
    wire [127:0] key1,key2,key3,key4,key5,key6,key7,key8;

    assign key6 = key << 25 | key >> 103;
    assign key5 = key6 << 25 | key6 >> 103;
    assign key4 = key5 << 25 | key5 >> 103;
    assign key3 = key4 << 25 | key4 >> 103;
    assign key2 = key3 << 25 | key3 >> 103;
    assign key1 = key2 << 25 | key2 >> 103; 
    round r1(.in(in),.key({inv_mod(key1[7*16+15:7*16]),inv_plus(key1[6*16+15:6*16]),inv_plus(key1[5*16+15:5*16]),inv_mod(key1[4*16+15:4*16]),key2[1*16+15:0*16]}),.out(round1));//2:4  new key:org key
    round r2(.in(round1),.key({inv_mod(key2[5*16+15:5*16]),inv_plus(key2[3*16+15:3*16]),inv_plus(key2[4*16+15:4*16]),inv_mod(key2[2*16+15:2*16]),key2[7*16+15:6*16]}),.out(round2)); 
    round r3(.in(round2),.key({inv_mod(key3[3*16+15:3*16]),inv_plus(key3[1*16+15:1*16]),inv_plus(key3[2*16+15:2*16]),inv_mod (key3[0*16+15:0*16]),key3[5*16+15:4*16]}),.out(round3)); 
    round r4(.in(round3),.key({inv_mod(key4[1*16+15:1*16]),inv_plus(key3[7*16+15:7*16]),inv_plus(key4[0*16+15:0*16]),inv_mod(key3[6*16+15:6*16]),key4[3*16+15:2*16]}),.out(round4)); 
    round r5(.in(round4),.key({inv_mod(key4[7*16+15:7*16]),inv_plus(key4[5*16+15:5*16]),inv_plus(key4[6*16+15:6*16]),inv_mod(key4[4*16+15:4*16]),key5[1*16+15:0*16]}),.out(round5)); 
    round r6(.in(round5),.key({inv_mod(key5[5*16+15:5*16]),inv_plus(key5[3*16+15:3*16]),inv_plus(key5[4*16+15:4*16]),inv_mod(key5[2*16+15:2*16]),key5[7*16+15:6*16]}),.out(round6)); 
    round r7(.in(round6),.key({inv_mod(key6[3*16+15:3*16]),inv_plus(key6[1*16+15:1*16]),inv_plus(key6[2*16+15:2*16]),inv_mod(key6[0*16+15:0*16]),key6[5*16+15:4*16]}),.out(round7)); 
    round r8(.in(round7),.key({inv_mod(key[1*16+15:1*16]),inv_plus(key6[7*16+15:7*16]),inv_plus(key[0*16+15:0*16]),inv_mod(key6[6*16+15:6*16]),key[3*16+15:2*16]}),.out(round8));

    assign out={mul(round8[3*16+15:3*16],(inv_mod(key[7*16+15:7*16]))),round8[1*16+15:1*16]+(inv_plus(key[6*16+15:6*16])),round8[2*16+15:2*16]+(inv_plus(key[5*16+15:5*16])),mul(round8[0*16+15:0*16],(inv_mod(key[4*16+15:4*16])))};

    function [15:0] inv_plus ;
        input     [15:0] in ;
        begin
            inv_plus=~in+1;
        end
    endfunction
    function [15:0] inv_mod ;
        input [15:0] in ;
        reg [16:0] b; 
        reg [100:0] a; 
        begin
            b=65535;
            inv_mod=1;
            a=in;
            a = (a % 65537 + 65537) % 65537;
            while (b) begin
                if (b&1) inv_mod = (a * inv_mod) % 65537;
                a = (a * a) % 65537;
                b=b>>1;
            end
        end
    endfunction
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