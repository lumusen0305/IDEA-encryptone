`timescale 1ns/100ps
module inv_mod_tb;
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

initial begin
    $display("out is %b",inv_mod(30));
    $finish;
end
endmodule

