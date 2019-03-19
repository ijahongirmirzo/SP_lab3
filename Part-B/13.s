.global _start
.data
buf: .skip 1024
message: .asciz "Enter a string: "
givenstr: .skip 100
nxtchars: .space 100
.text
_start:
# To output message 
movq $1,%rax
movq $1, %rdi
movq $message, %rsi
movq $16, %rdx 
syscall
# To output message
movq $0, %rax
movq $0, %rdi
movq $givenstr, %rsi
movq $100, %rdx
syscall


movq %rax, %r8
movq %r8, %rcx
decq %rcx
movq $givenstr, %rsi
movq $nxtchars, %rdi


up:
movb (%rsi), %al
subb $9, %al
down:
movb %al, (%rdi)
incq %rsi
incq %rdi
decq %rcx
jnz up
movb (%rsi), %al
movb %al, (%rdi)

movq $1,%rax
movq $1, %rdi
movq $nxtchars, %rsi
movq $100, %rdx 
syscall


movq $60, %rax
xorq %rdi, %rdi
syscall

