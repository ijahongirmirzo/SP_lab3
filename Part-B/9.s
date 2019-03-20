.global _start
.data
	  message: .string "Please enter a number: "
	  mess_len: .quad 23
	  x: .skip 12
	  ans: .skip 8
	  format: .string "%ld\n"
.text
_start:
	  movq $1, %rax
	  movq $1, %rdi
	  movq $message, %rsi
	  movq mess_len, %rdx
	  syscall

	  movq $0, %rax
	  movq $0, %rdi
	  movq $x, %rsi
	  movq $11, %rdx
	  syscall
	  
	  movq %rax, %rcx
	  decq %rcx
	  xorq %rdx, %rdx
	  orq $1, %rbx
	  mov (%rsi), %al

	  xorq %r10, %r10 
	  cmp $'+', %al
	  je plus
	  cmp $'-', %al
	  je minus
	  jmp up
minus:
	  orq $1, %r10
plus:
	  decq %rcx
	  incq %rsi
up:  
	  decq %rcx
	  mov (%rsi, %rcx), %al
	  sub $48, %al
	  movq %rax, %r8
	  imulq %rbx, %r8
	  addq %r8, %rdx
	  
	  imulq $10, %rbx
	  cmp $0, %rcx  
	  jnz up
	  cmpq $1, %r10
	  je neg
	  jmp print
neg:
	  negq %rdx
print:
	  movq %rdx, %rax
	  pushq %rax  
	  movq $format, %rdi  
	  movq %rax, %rsi
	  xorq %rax, %rax
	  call printf
	  
	  movq $60, %rax
	  xorq %rdi, %rdi
	  syscall
