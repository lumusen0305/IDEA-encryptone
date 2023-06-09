`timescale 1ns/100ps
module round_tb;
reg [63:0] in;
reg [127:0] key1;
wire [63:0] out;
wire[15:0] step1, step2, step3, step4, step5, step6, step7, step8, step9, step10;
wire [127:0] key2,key3,key4,key5,key6,key7,key8;
round r2(.in(in),.key(0),.out(out),
.step1(step1),
.step2(step2),
.step3(step3),
.step4(step4),
.step5(step5),
.step6(step6),
.step7(step7),
.step8(step8),
.step9(step9),
.step10(step10));//6:0  new key:org key
assign key2=key1<<<25;
assign key3=key2<<<25;
assign key4=key3<<<25;
initial begin
    #10
    in=64'b0010011010001111110111110111110100100100100001011111101000000010;
    key1=0;
    #100
    // $display("test %b",16'b0101010101010110*16'b0000000000000011);
    $display("in     is %b",in);
    $display("step1  is %b",step1);
    $display("step2  is %b",step2);
    $display("step3  is %b",step3);
    $display("step4  is %b",step4);
    $display("step5  is %b",step5);
    $display("step6  is %b",step6);
    $display("step7  is %b",step7);
    $display("step8  is %b",step8);
    $display("step9  is %b",step9);
    $display("step10  is %b",step10);
    $display("out    is %b",out);
    #300
    $finish;
end
endmodule
