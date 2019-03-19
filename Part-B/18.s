.global _start
.data
format: .asciz ", %d"
x: .quad 0
message: .asciz "Enter value for n: "
message2: .asciz "Prime numbers between 1 and %d are : 1"
message3: .asciz "\n"
f: .asciz "%d"
.text
isprime: # declaring isprime function
movq %rdi, %r8 #passing the first argument to r8
movq $1, %r13
nextstage:
incq %r13
cmpq %r8, %r13
je prime
movq %rdi, %rax
cqto
idivq %r13 #diving each number until the given to check it is prime or not
movq %rdx, %rcx #move the remainder to rcx
jrcxz notprime #if the remainder is zero, then the number is not prime
jmp nextstage
notprime:
movq $1, %rax
ret
prime:
movq $0, %rax
ret
_start:
movq $message, %rdi
call puts #displaying a message
scan:
movq $0, %rax
movq $f, %rdi
movq $x, %rsi
call scanf #getting an input
movq x, %r12
cmpq $1, %r12
je end
movq $1, %r8 #checking each number up until the given
pushq %r8
pushq %r12
movq $message2, %rdi
movq %r12, %rsi
xorq %rax, %rax
call printf
xorq %rdi, %rdi
call fflush
popq %r12
popq %r8
l0:
incq %r8 #incrementing the changing number that we check
cmpq %r8, %r12
je end
movq %r8, %rdi
call isprime #check whether it is prime or not
movq %rax, %rcx
jrcxz l1
jmp l0
l1:
jrcxz print
jmp l0
print: #print out the prime number
pushq %rax
pushq %r8
movq $format, %rdi
movq %r8, %rsi
xorq %rax, %rax
call printf
xorq %rdi, %rdi
call fflush
popq %r8
popq %rax
movq $1, %rcx
jmp l0
end:
movq $message3, %rdi
call puts
movq $60, %rax
xorq %rdi, %rdi
syscall #exit the program