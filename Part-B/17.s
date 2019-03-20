.global _start
.data
	n: .quad 7
	ans: .quad 7
	message: .asciz "Enter the value for n="
	informat: .asciz "%d"
	outformat: .asciz "n!=%d\n"
	.text
_start:
	movq $message, %rdi
	xorq %rax, %rax
	call printf
	
	xorq %rax, %rax
	movq $informat, %rdi
	movq $n, %rsi
	call scanf	

	movq n, %rcx	
	movq $1, %rax
loop1:
	movq %rcx, %rdx
	mulq %rdx
	decq %rcx
	jnz loop1
#endloop1
	movq %rax, ans
	movq $outformat, %rdi
	movq ans, %rsi
	xorq %rax, %rax
	call printf
	
	movq $60, %rax
	xorq %rdi, %rdi
	syscall
