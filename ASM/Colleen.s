section .text
	global _main
	extern _printf
;
	;Beau com
;
_func:
ret
_main:
;
	;Trop beau
;
push rbp
mov rbp, rsp
sub rsp, 16
call _func
lea rdi, [rel str]
mov rsi, 10
mov rdx, 9
mov rcx, 59
mov r8, 34
lea r9, [rel str]
call _printf
mov rsp, rbp
pop rbp
mov rax, 0
ret
section .data
str: db "section .text%1$c%2$cglobal _main%1$c%2$cextern _printf%1$c%3$c%1$c%2$c%3$cBeau com%1$c%3$c%1$c_func:%1$cret%1$c_main:%1$c%3$c%1$c%2$c%3$cTrop beau%1$c%3$c%1$cpush rbp%1$cmov rbp, rsp%1$csub rsp, 16%1$ccall _func%1$clea rdi, [rel str]%1$cmov rsi, 10%1$cmov rdx, 9%1$cmov rcx, 59%1$cmov r8, 34%1$clea r9, [rel str]%1$ccall _printf%1$cmov rsp, rbp%1$cpop rbp%1$cmov rax, 0%1$cret%1$csection .data%1$cstr: db %4$c%5$s%4$c%1$c"
