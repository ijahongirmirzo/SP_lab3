
.global _start
.data
message: .asciz "ENTER A VALUE FOR n :"
format:
.asciz "%20ld\n"
format1: .asciz "THE LIST OF FIRST n=%8ld FIBONACCI NUMBERS\n"
f:.string "%d"
x:.quad 0
.text
_start:
pushq %rbx
#message pointer → %rdi
movq $message, %rdi
call puts
pushq %rbp
movq $0, %rax
movq $f, %rdi
movq $x, %rsi
call scanf
popq %rbp
movq x, %rax 
pushq %rax
pushq %rcx
movq $format1, %rdi
movq %rax, %rsi
xorq %rax,%rax
call printf
pop %rcx
pop %rax
movq %rax, %rcx
xorq %rax, %rax
xorq %rbx, %rbx
incq %rbx
print:
push %rax
push %rcx
movq $format, %rdi
movq %rax, %rsi
xorq %rax, %rax
call printf
pop %rcx
pop %rax
movq %rax, %rdx
movq %rbx, %rax
addq %rdx, %rbx
decq %rcx
jnz print
pop %rbx
movq $60, %rax
xorq %rdi, %rdi
syscall
