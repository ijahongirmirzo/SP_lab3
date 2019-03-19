 .data
	input: .skip 1024
	entermess: .string "Enter a string:\n "
	messformat1: .asciz "The given string %.*s is a Palindrome\n"
	messformat2: .asciz "The given string %.*s is not a Palindrome\n"


.text
.global _start
_start:
	// output text
	movq $1, %rax
	movq $1, %rdi
	movq $entermess, %rsi
	movq $16, %rdx
	syscall
	
	// input	
	movq $0, %rax
	movq $0, %rdi
	movq $input, %rsi
	movq $1024, %rdx
	syscall

	//getting size
	subq $2, %rax
	movq %rax, %r10
	incq %rax
	movq %rax, %r8
	
	
LOOP:	
	movb (%rsi), %al
	movb (%rsi,%r10), %bl
	cmp %al, %bl
	jnz NZERO
	cmpq %r10, %r11
	jg Finish
	decq %r10
	incq %r11
	jmp LOOP
	

Finish:
	movq $messformat1, %rdi
	movq $input, %rdx
	movq %r8, %rsi
	call printf
	jmp EXIT

NZERO:
	movq $messformat2, %rdi
	movq $input, %rdx
	movq %r8, %rsi
	call printf


EXIT:
	movq $60, %rax
	xorq %rsi, %rsi
	syscall

