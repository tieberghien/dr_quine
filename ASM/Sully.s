%define MACH_SYSCALL(nb)	0x2000000 | nb

section .text
global _main
extern _printf
extern _fopen
extern _fclose

_main:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	lea rdi, [rel sully]
	mov rsi, 5
	call _printf
	dec rsi
	cmp rsi, 0
;	call _fopen
	leave
	ret	

section .data
sully:
	.string db "Sully_%d", 0
