section .text
global _main
extern _printf
extern _fopen
extern _fclose

_main:
	push rbp
	mov rbp, rsp
	sub rsp, 16
;	lea rdi, [rel sully]
;	push rax
	mov rax, 5

_loop:
	cmp rax, 0
	jle _done
;	mov rdi, rsp
	mov rsi, rax
	lea rdi, [rel sully]
	call _printf
	dec rsi
	mov rax, rsi
	jmp _loop

_done:
	leave
	ret

section .data
sully:
	.string db "Sully_%d", 10
