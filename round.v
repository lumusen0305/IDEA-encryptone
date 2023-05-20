module round(in,key,out,step1, step2, step3, step4, step5, step6, step7, step8, step9, step10);
// module round(in,key,out);
input [16*4-1:0] in;
input [16*6-1:0] key;
output [16*4-1:0] out;
output[15:0] step1, step2, step3, step4, step5, step6, step7, step8, step9, step10;
wire[15:0] step1, step2, step3, step4, step5, step6, step7, step8, step9, step10;

// assign step1 =  in[0*16+15:0*16]*key[0*16+15:0*16];
assign step1 =  mul(in[3*16+15:3*16],key[5*16+15:5*16]);

assign step2 =  in[2*16+15:2*16]+key[4*16+15:4*16];
assign step3 =  in[1*16+15:1*16]+key[3*16+15:3*16];
assign step4 =  mul(in[0*16+15:0*16],key[2*16+15:2*16]);

assign step5 = step1^step3;
assign step6 = step2^step4;

assign step7 = mul(step5,key[1*16+15:1*16]);
assign step8 = step6+step7;

assign step9 = mul(step8,key[0*16+15:0*16]);
assign step10 = step7+step9;
assign out={step1^step9,step3^step9,step2^step10,step4^step10};

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

