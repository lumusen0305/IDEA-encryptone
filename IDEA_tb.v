`timescale 1ns/100ps
module decrypt_tb;
reg [63:0] in;
reg [127:0] key;
wire [63:0] ptc,ctp;

encrypt enc(
.in(in),
.out(ptc),
.key(key));

decrypt dec(
.in(ptc),
.out(ctp),
.key(key));


initial begin
    in=130;
    key=1060;
    #10
    $display("輸入       ： %d",in);
    $display("加密後的密文： %d",ptc);
    $display("解密後的明文： %d",ctp);
    #300
    $finish;
end
endmodule
