extern _open
extern _dprintf
%define WRCREAT_TRUNC  0x0001 | 0x0200 | 0x0400
%define S_IRWXU 0644o

%macro FT 1
global _main
_main:
push rbp
mov rbp, rsp
sub rsp, 16
lea rdi, [rel kid]
mov rsi, WRCREAT_TRUNC
mov rdx, S_IRWXU
call _open
cmp rax, -1
je _return
mov rdi, rax
lea rsi, [rel str]
mov rdx, 10
mov rcx, 9
mov r8, 59
mov r9, 34
lea r10, [rel str]
call _dprintf
_return:
mov rsp, rbp
pop rbp
ret
%endmacro
section .data
str: db 'extern _open%1$cextern _dprintf%1$c%%define WRCREAT_TRUNC  0x0001 | 0x0200 | 0x0400%1$c%%define S_IRWXU 0644o%1$c%1$c%%macro FT 1%1$cglobal _main%1$c_main:%1$cpush rbp%1$cmov rbp, rsp%1$csub rsp, 16%1$clea rdi, [rel kid]%1$cmov rsi, WRCREAT_TRUNC%1$cmov rdx, S_IRWXU%1$ccall _open%1$ccmp rax, -1%1$cje _return%1$cmov rdi, rax%1$clea rsi, [rel str]%1$cmov rdx, 10%1$cmov rcx, 9%1$cmov r8, 59%1$cmov r9, 34%1$clea r10, [rel str]%1$ccall _dprintf%1$c_return:%1$cmov rsp, rbp%1$cpop rbp%1$cret%1$c%%endmacro%1$csection .data%1$cstr: db %4$c%5$s%4$c%1$c%1$ckid: db "Grace_kid.s"%1$csection .text%1$cFT _main%1$c', 0
kid: db "Grace_kid.s"
section .text
FT _main
