# IDEA-encryptone
## 編譯指令
```
vcs -full64 -cpp g++-4.4 -cc gcc-4.4 -LDFLAGS -Wl,-no-as-needed ./IDEA_tb.v  ./round.v ./decrypt.v  ./encrypt.v  +v2k -debug_all   -R -l log.txt +lint=PCWM\clear
```
## 說明
+ IDEA_tb.v
    + 驗證加解密電路
+ decrypt.v
    + decrypt circuit
+ encrypt.v
    + encrypt circuit
+ round.v
    + 輪加密的一輪