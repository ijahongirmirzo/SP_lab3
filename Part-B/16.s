.global _start
.data

str1: .asciz "Enter a String: "
str2: .asciz "OutputA: %s"
str3: .asciz "OutputB: %s"
str4: .asciz "OutputC: %s"
string: .skip 1024
flag: .quad 0
.text


_start:
		movq $str1, %rdi					/* moving string value to register */
		xorq %rax, %rax						/* clearing rax register */
		call puts						/* calling puts function */
		
		movq $0, %rax
		movq $0, %rdi
		movq $1024, %rdx
		movq $string, %rsi
		syscall			        /* writing value from user to $string */

		decq %rax			/* decrementing value of the register rax */
		 														
												
		movq $0, %rdi			/* setting values of registers to 0 */
		movq $string, %rdx
		
loop1:
		cmpq %rdi, %rax
		je end1
 
		leaq (%rdx,%rdi), %rsi
 
		cmpb  $123, (%rsi)             /* checking ascii value of character */
		jge skip             		/* jump if greater or equal */                                       

		cmpb $97, (%rsi)               /* checking ascii value of character */
		jge lowtoup               	/* jump if greater or equal */

		skip:
		incq %rdi                     /* go to the next character of string */

		jmp  loop1                      


lowtoup:		
movq $-32, %r8
addq %r8, (%rsi)                             
incq %rdi                             /* go to the next character of string */
jmp loop1


end1:		

		pushq %rax
		movq $str2, %rdi
		movq $string, %rsi
		xorq %rax, %rax
		call printf               /*printing certain string with certain counter value */ 
		popq %rax


		movq $0, %rdi			/* setting values of registers to 0 */
		movq $string, %rdx #setting the base address
		
loop2:
		cmpq %rdi, %rax
		je end2
 
		leaq (%rdx,%rdi), %rsi
 
		cmpb $91, (%rsi)               /* checking ascii value of character */
		jge skip1           /* jump if greater or equal */

		cmpb $65, (%rsi)               /* checking ascii value of character */
		jge uptolow            /* jump if greater or equal */

		skip1:
		incq %rdi                     /* go to the next character of string */

		jmp  loop2                      


uptolow:		# converting uppercase letters to lowercase letters
movq $32, %r8		#adding 32 to the ascii value of the variable
addq %r8, (%rsi)                             
incq %rdi               /* go to the next character of string */
jmp loop2




end2:

		pushq %rax
		movq $str3, %rdi
		movq $string, %rsi
		xorq %rax, %rax
		call printf               /*printing certain string with certain counter value */ 
		popq %rax


movq $0, %rdi			/* setting values of registers to 0 */
movq $string, %rdx
movq $0, flag
loop3:
		cmpq %rdi, %rax
		je end3
 
		leaq (%rdx,%rdi), %rsi
 		
		cmpq $0, flag #flag zero shows that the first letter has not been capitalized
		je flag0
		jmp flag1 #flag 1 shows that the first letter has been capitalized
		
		flag0:
		cmpb  $123, (%rsi)    /* checking ascii value of character */
		jge skip2             /* jump if greater or equal */                                       

		cmpb $97, (%rsi)           /* checking ascii value of character */
		jge lowtoup1               /* jump if greater or equal */
                    

		flag1:
		cmpb $91, (%rsi)     /* checking ascii value of character */
		jge skip2           /* jump if greater or equal */

		cmpb $65, (%rsi)       /* checking ascii value of character */
		jge uptolow1          /* jump if greater or equal */


		skip2:
		cmpb $32, (%rsi)# setting the flag to zero because of the space and the beginning of the new word
		je flagreset
		jmp skip3
		flagreset: movq $0, flag
		skip3:
		incq %rdi                     /* go to the next character of string */

		jmp  loop3                     


lowtoup1:		
movq $-32, %r8
addq %r8, (%rsi)                             
incq %rdi                             /* go to the next character of string */
movq $1, flag
jmp loop3

uptolow1:		
movq $32, %r8
addq %r8, (%rsi)                             
incq %rdi                             /* go to the next character of string */
jmp loop3




end3:

		pushq %rax
		movq $str4, %rdi
		movq $string, %rsi
		xorq %rax, %rax
		call printf               /*printing certain string with certain counter value */ 
		popq %rax
		movq $60, %rax
		xorq %rdi, %rdi
		syscall                   /* end of program */
 
