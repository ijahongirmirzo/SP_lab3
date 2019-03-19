.global _start
.data
message: .asciz "Uzbekistan is developing country\n"
nxtcharm: .space 30
.text
_start:
.text
movq $1, %rax
movq $1, %rdi
movq $message, %rsi
movq $27, %rdx
syscall
movq $25, %rcx
movq $nxtcharm, %rdi
movq $message, %rsi
up: movb (%rsi), %al
addb $1, %al
movb %al, (%rdi)
incq %rsi
incq %rdi
decq %rcx
jnz up
movb (%rsi), %al
movb %al, (%rdi)
incq %rsi
incq %rdi
movb (%rsi), %al
movb %al, (%rdi)
movq $1, %rax
movq $1, %rdi
movq $nxtcharm, %rsi
movq $27, %rdx
syscall
movq $60, %rax
xorq %rdi, %rdi
syscall
