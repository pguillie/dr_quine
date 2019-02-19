;; This program will print its own source when run.

section .text

global _main

extern _printf

_main:
	; Comment.
	push	rbp
	mov	rbp, rsp
	lea	rdi, [rel source]
	call	print_source
	xor	rax, rax
	leave
	ret

print_source:
	push	rbp
	mov	rbp, rsp
	mov	rsi, rdi
	mov	rdx, 0xa
	mov	rcx, 0x9
	mov	r8, 0x22
	call	_printf
	leave
	ret

section .data

source: db ";; This program will print its own source when run.%2$c%2$csection .text%2$c%2$cglobal _main%2$c%2$cextern _printf%2$c%2$c_main:%2$c%3$c; Comment.%2$c%3$cpush%3$crbp%2$c%3$cmov%3$crbp, rsp%2$c%3$clea%3$crdi, [rel source]%2$c%3$ccall%3$cprint_source%2$c%3$cxor%3$crax, rax%2$c%3$cleave%2$c%3$cret%2$c%2$cprint_source:%2$c%3$cpush%3$crbp%2$c%3$cmov%3$crbp, rsp%2$c%3$cmov%3$crsi, rdi%2$c%3$cmov%3$crdx, 0xa%2$c%3$cmov%3$crcx, 0x9%2$c%3$cmov%3$cr8, 0x22%2$c%3$ccall%3$c_printf%2$c%3$cleave%2$c%3$cret%2$c%2$csection .data%2$c%2$csource: db %4$c%1$s%4$c%2$c"
