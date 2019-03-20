#The following program reads a string from keyboard, stores it in memory
#at location givenstr and then takes each character from that location and
#converts it to its next ascii character stores it in buffer nxtchars:
# To create object file using GNU assembler as
#
 #$as -gstabs rwnextchar.s -o rwnextchar.o
# To create an executable file after linking
#
/*  $ld rwnextchar.o -o rwnextchar */
# To execute nextchar
#
/*  $./rwnextchar */

.global _start
.data
 message: .asciz "ENTER A STRING :"
givenstr: .skip 30
nxtchars: .space 30
.text
_start: movq $1, %rax #sys_write
movq $1, %rdi
movq $message, %rsi
movq $16, %rdx
syscall
movq $0, %rdi #sys_read
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
addb $1, %al
movb %al, (%rdi)
incq %rsi
incq %rdi
decq %rcx
jnz up
movb (%rsi), %al
movb %al, (%rdi)
movq $1, %rax #sys_write
movq $1, %rdi
movq $nxtchars, %rsi
movq %r8, %rdx
syscall
movq $60, %rax #sys_exit
xorq %rdi, %rdi
syscall
