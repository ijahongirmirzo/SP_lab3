.global _start
.data
message: .asciz "ENTER A STRING :"
givenstr: .skip 30
nxtchars: .space 30
.text
_start: movq $1, %rax 
movq $1, %rdi
movq $message, %rsi
movq $16, %rdx
syscall
movq $0, %rdi 
movq $givenstr, %rsi
movq $30, %rdx
movq $0, %rax
syscall
movq %rax, %r8
movq %r8, %rcx
decq %rcx
movq $givenstr, %rsi
movq $nxtchars, %rdi
up: movb (%rsi), %al
addb $9, %al
movb %al, (%rdi)
incq %rsi
incq %rdi
decq %rcx
jnz up
movb (%rsi), %al
movb %al, (%rdi)
movq $1, %rax 
movq $1, %rdi
movq $nxtchars, %rsi
movq %r8, %rdx
syscall
movq $60, %rax 
xorq %rdi, %rdi
syscall
