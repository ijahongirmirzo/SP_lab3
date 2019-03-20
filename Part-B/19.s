.global _start 
  .data
  output: .asciz "Enter value for n: "
  format:  .asciz "%1d\n"
  format1: .asciz "Number of 1s in the given number %ld = %ld\n"
  n:      .string "%ld"
  nf:    .quad 0

  .text
_start:

  movq $1,%rax
  movq $1, %rdi
  movq $output, %rsi
  movq $19, %rdx
  syscall

 
  movq $0, %rax
  movq $n, %rdi
  movq $nf, %rsi
  call scanf
   

  movq nf,%rdi

  call count


   movq $format1, %rdi
   movq nf, %rsi
   movq %rax, %rdx
   xorq %rax, %rax
   call printf
  
  
  movq $60, %rax
  xorq %rdi, %rdi
  syscall
 
count:
  movq $0, %rax
  testq %rdi, %rdi
  je .out
  pushq %rbx
  movq %rdi, %rbx
  andq $1, %rbx
  shrq %rdi 
  call count
  addq %rbx, %rax
  popq %rbx
  

.out:
  ret
