section .text
	global _start          ;must be declared for linker (ld)

_start:                ;tell linker entry point
	mov rdi, filename
	mov rsi, 0102o     ;O_CREAT, man open
	mov rdx, 0666o     ;umode_t
	mov rax, 2
	syscall

	mov [fd], rax
	mov rdx, len       ;message length
	mov rsi, msg       ;message to write
	mov rdi, [fd]      ;file descriptor
	mov rax, 1         ;system call number (sys_write)
	syscall            ;call kernel

	mov rdi, [fd]
	mov rax, 3         ;sys_close
	syscall

	mov rax, 60        ;system call number (sys_exit)
	syscall            ;call kernel

section .data
	msg db 'Hello, world', 0xa
	len equ $ - msg
	filename db 'test.txt', 0
	lenfilename equ $ - filename
	fd dq 0
