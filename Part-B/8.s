.global _start
.data
n: .quad 0
listn: .space 800
format1: .asciz "ENTER LIST OF n=%ld NUMBERS\n:"
format2: .asciz "THE GIVEN LIST OF n=%ld NUMBERS\n"
message: .asciz "ENTER A VALUE FOR n :"
f1: .string "%ld"
f2: .string "%ld\n"
.text
_start:
movq $message, %rdi
call puts

movq $0, %rax
movq $f1, %rdi
movq $n, %rsi
call scanf

movq n, %rax
pushq %rcx
movq $format1, %rdi
movq %rax, %rsi
xorq %rax, %rax
call printf

popq %rcx
movq $listn, %rdx
movq n, %rcx
up:
  pushq %rdx
  pushq %rcx
  pushq %rbp
  movq $0, %rax
  movq $f1, %rdi
  movq %rdx, %rsi
  call scanf
  
  popq %rbp
  popq %rcx
  popq %rdx
  addq $8, %rdx
  decq %rcx
  jne up
  
  movq n, %rax
  pushq %rcx
  movq $format2, %rdi
  movq %rax, % rsi
  xorq %rax, %rax
  call printf
  popq %rcx
  movq $listn, %rdx
  movq n, %rcx
up1:
  pushq %rdx
  pushq %rcx
  pushq %rbp
  movq $0, %rax
  movq $f2, %rdi
  movq (%rdx), %rsi
  call printf
  popq %rbp
  popq %rcx
  popq %rdx
  addq $8, %rdx
  decq %rcx
  jne up1
  
  movq $60, %rax
  xorq %rdi, %rdi
  syscall
