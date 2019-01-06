%define WRCREAT_TRUNC  0x0001 | 0x0200 | 0x0400
%define S_IRWXU 0644o

%macro FT 1
;outside comment
section .text
	global _main
	extern _dprintf
	extern _asprintf
	extern _open
	extern _close
	extern _memcpy
	extern _system

_main:
	push rbp

	mov rdx, [rel initial]
	cmp rdx, -1
	jle _stop

	mov rdx, [rel initial]
	dec rdx
	mov [rel initial], rdx

	lea rdi, [rel base_text]
	lea rsi, [rel data]
	mov rdx, len
	call _memcpy

	lea rdi, [rel string_s]
	lea rsi, [rel filename]
	mov rdx, [rel initial]
	call _asprintf

	mov rdi, [rel string_s]
	mov rsi, WRCREAT_TRUNC
	mov rdx, 0644o
	call _open
	push rax

	lea rdi, [rel data]
	mov rax, 37
	mov rcx, len - 1
	call _replace

	pop rdi
	push rdi
	lea rsi, [rel data]
	lea rdx, [rel dquote]
	lea rcx, [rel base_text]
	lea r8, [rel dquote]
	mov r9, [rel initial]
	sub rsp, 8
	push r8
	push r8
	push r8
	push r8
	call _dprintf
	pop r8
	pop r8
	pop r8
	pop r8
	add rsp, 8
	pop rdi
	call _close

	lea rdi, [rel exec_string]
	lea rsi, [rel exec]
	mov rdx, [rel initial]
	mov rcx, [rel initial]
	mov r8, [rel initial]
	mov r9, [rel initial]
	call _asprintf

	mov rdi, [rel exec_string]
	call _system
	pop rbp
	ret

_replace:
	repne scasb
	cmp byte [rel rdi], 99
	jne _replace
	mov byte [rel rdi], 10
	cmp rcx, 0
	jne _replace
	ret

_stop:
	pop rbp
	ret

section .data
	data db "%%define FLAGS 0x0200 | 0x0400 | 0x0001%c%c%%macro test 1%c%c;outside comment%csection .text%c	global _main%c	extern _dprintf%c	extern _asprintf%c	extern _open%c	extern _close%c	extern _memcpy%c	extern _system%c%c_main:%c	push rbp%c	mov rdx, [rel initial]%c	cmp rdx, 0%c	jle _stop%c	mov rdx, [rel initial]%c	dec rdx%c	mov [rel initial], rdx%c%c	lea rdi, [rel base_text]%c	lea rsi, [rel data]%c	mov rdx, len%c	call _memcpy%c%c	lea rdi, [rel string_s]%c	lea rsi, [rel filename]%c	mov rdx, [rel initial]%c	call _asprintf%c%c	mov rdi, [rel string_s]%c	mov rsi, FLAGS%c	mov rdx, 644q%c	call _open%c	push rax%c%c	lea rdi, [rel data]%c	mov rax, 37%c	mov rcx, len - 1%c	call _replace%c%c	pop rdi%c	push rdi%c	lea rsi, [rel data]%c	lea rdx, [rel dquote]%c	lea rcx, [rel base_text]%c	lea r8, [rel dquote]%c	mov r9, [rel initial]%c	sub rsp, 8%c	push r8%c	push r8%c	push r8%c	push r8%c	call _dprintf%c	pop r8%c	pop r8%c	pop r8%c	pop r8%c	add rsp, 8%c	pop rdi%c	call _close%c%c	lea rdi, [rel exec_string]%c	lea rsi, [rel exec]%c	mov rdx, [rel initial]%c	mov rcx, [rel initial]%c	mov r8, [rel initial]%c	mov r9, [rel initial]%c	call _asprintf%c%c	mov rdi, [rel exec_string]%c	call _system%c	pop rbp%c	ret%c%c_replace:%c	repne scasb%c	cmp byte [rel rdi], 99%c	jne _replace%c	mov byte [rel rdi], 10%c	cmp rcx, 0%c	jne _replace%c	ret%c%c_stop:%c	pop rbp%c	ret%c%csection .data%c	data db %s%s%s, 0%c%c	len equ $ - data - 1%c	dquote db 34, 0%c	filename db %%1, 0%c	initial dq %hhd%c	exec db %snasm -f macho64 Sully_%%hhd.s && ld Sully_%%hhd.o -o Sully_%%hhd -macosx_version_min 10.8 -lSystem; ./Sully_%%hhd%s, 0%c%csection .bss%c	base_text resb len%c	exec_name resb 10%c	exec_string resb 4%c	string_s resb 4%c%c%%endmacro%c%ctest %sSully_%%hhd.s%s%c", 0

	len equ $ - data - 1
	dquote db 34, 0
	filename db %1, 0
	initial dq 5
	exec db "nasm -f macho64 Sully_%d.s && ld Sully_%d.o -o Sully_%d -macosx_version_min 10.8 -lSystem; ./Sully_%d", 0

section .bss
	base_text resb len
	exec_name resb 10
	exec_string resb 4
	string_s resb 4

%endmacro
FT "Sully_%d.s"
