%define i 5
%defstr file_x Sully_ %+ i %+ .s
%defstr obj_x Sully_ %+ i %+ .o
%defstr exe_x Sully_ %+ i
%assign next_i i-1

%macro print_source 3
	mov	rdi, %1
	lea	rsi, %2
	lea	rdx, %2
	mov	rcx, 0xa
	mov	r8, 0x9
	mov	r9, 0x22
	mov	r10, %3
	push	r10
	call	_dprintf
	pop	r10
%endmacro

%macro compile 0
	jmp %%sys
	%%cmd: db "/Users/pguillie/.brew/bin/nasm -fmacho64 ", file_x, " && /usr/bin/gcc -o ", exe_x, " ", obj_x, " && rm ", obj_x, 0x0
	%%sys:
	lea	rdi, [rel %%cmd]
	call	_system
%endmacro

%macro execute 0
	jmp %%sys
	%%cmd: db "./", exe_x, 0x0
	%%sys:
	lea	rdi, [rel %%cmd]
	call	_system
%endmacro

section .text

extern _main, _dprintf, _system

_main:
	push	rbp
	mov	rbp, rsp
	mov	rax, 0x2000005
	lea	rdi, [rel file]
	mov	rsi, 0x601
	mov	rdx, 0o644
	syscall
	jc	error
	push	rax
	print_source rax, [rel source], next_i
	mov	rax, 0x2000006
	pop	rdi
	syscall
	compile
	test	rax, rax
	jne	error
	mov	rax, i
	cmp	rax, 0
	jle	return
	execute
return:
	xor	rax, rax
	leave
	ret
error:
	mov	rax, 0x1
	leave
	ret

section .data
file: db file_x, 0x0
source: db "%%define i %5$d%2$c%%defstr file_x Sully_ %%+ i %%+ .s%2$c%%defstr obj_x Sully_ %%+ i %%+ .o%2$c%%defstr exe_x Sully_ %%+ i%2$c%%assign next_i i-1%2$c%2$c%%macro print_source 3%2$c%3$cmov%3$crdi, %%1%2$c%3$clea%3$crsi, %%2%2$c%3$clea%3$crdx, %%2%2$c%3$cmov%3$crcx, 0xa%2$c%3$cmov%3$cr8, 0x9%2$c%3$cmov%3$cr9, 0x22%2$c%3$cmov%3$cr10, %%3%2$c%3$cpush%3$cr10%2$c%3$ccall%3$c_dprintf%2$c%3$cpop%3$cr10%2$c%%endmacro%2$c%2$c%%macro compile 0%2$c%3$cjmp %%%%sys%2$c%3$c%%%%cmd: db %4$c/Users/pguillie/.brew/bin/nasm -fmacho64 %4$c, file_x, %4$c && /usr/bin/gcc -o %4$c, exe_x, %4$c %4$c, obj_x, %4$c && rm %4$c, obj_x, 0x0%2$c%3$c%%%%sys:%2$c%3$clea%3$crdi, [rel %%%%cmd]%2$c%3$ccall%3$c_system%2$c%%endmacro%2$c%2$c%%macro execute 0%2$c%3$cjmp %%%%sys%2$c%3$c%%%%cmd: db %4$c./%4$c, exe_x, 0x0%2$c%3$c%%%%sys:%2$c%3$clea%3$crdi, [rel %%%%cmd]%2$c%3$ccall%3$c_system%2$c%%endmacro%2$c%2$csection .text%2$c%2$cextern _main, _dprintf, _system%2$c%2$c_main:%2$c%3$cpush%3$crbp%2$c%3$cmov%3$crbp, rsp%2$c%3$cmov%3$crax, 0x2000005%2$c%3$clea%3$crdi, [rel file]%2$c%3$cmov%3$crsi, 0x601%2$c%3$cmov%3$crdx, 0o644%2$c%3$csyscall%2$c%3$cjc%3$cerror%2$c%3$cpush%3$crax%2$c%3$cprint_source rax, [rel source], next_i%2$c%3$cmov%3$crax, 0x2000006%2$c%3$cpop%3$crdi%2$c%3$csyscall%2$c%3$ccompile%2$c%3$ctest%3$crax, rax%2$c%3$cjne%3$cerror%2$c%3$cmov%3$crax, i%2$c%3$ccmp%3$crax, 0%2$c%3$cjle%3$creturn%2$c%3$cexecute%2$creturn:%2$c%3$cxor%3$crax, rax%2$c%3$cleave%2$c%3$cret%2$cerror:%2$c%3$cmov%3$crax, 0x1%2$c%3$cleave%2$c%3$cret%2$c%2$csection .data%2$cfile: db file_x, 0x0%2$csource: db %4$c%1$s%4$c, 0x0%2$c", 0x0
