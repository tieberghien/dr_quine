extern _open
%define WRCREAT_TRUNC  0x0001 | 0x0200 | 0x0400
%define S_IRWXU 0644o

%macro FT 0
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

_return:
mov rsp, rbp
pop rbp
ret
%endmacro
section .data
str: db "section .text"
kid: db "Grace_kid.s"
section .text
FT
