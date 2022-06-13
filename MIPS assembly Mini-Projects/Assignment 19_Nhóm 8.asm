.data
	input_variableName: .space 50
	INPUT_variableName_MESSAGE: .asciiz "Enter a Variable Name: "
	INPUT_variableName_INVALID_MESSAGE:	.asciiz "Invalid Variable Name.\nPlease re-enter 0 < variableName <= 20 (charater)"
	variableName_TRUE_1: .asciiz "variableName("
	variableName_TRUE_2: .asciiz ") = true \n"
	variableName_FALSE_1: .asciiz "variableName("
	variableName_FALSE_2: .asciiz ") = false \n"
	ConfirmDialog_MESSAGE: .asciiz "Do you want to continue?"

.text
main:	
	jal	getvariableName 		
	nop
	jal 	check1stCharacter		# Check first character
	nop
	bne    	$s1, 10, check			# if character is not end of string -> branch check
	nop
	jal 	print
	nop

print:
	sb 	$0, input_variableName($t0)
	li	$v0, 4
	la	$a0, variableName_TRUE_1
	syscall
	li	$v0, 4
	la	$a0, input_variableName
	syscall
	li	$v0, 4
	la	$a0, variableName_TRUE_2
	syscall
	j 	confirmDialog
	nop

#---------------------------------------------------------------------------
# Nguoi dung nhap vao ten bien
#---------------------------------------------------------------------------

getvariableName_invalid:
	li 	$v0, 55					# input again ( 0 < variable name <= 20 ) 
	la 	$a0, INPUT_variableName_INVALID_MESSAGE
	li 	$a1, 0
	syscall

getvariableName:
	li 	$v0, 54
	la 	$a0, INPUT_variableName_MESSAGE
	la 	$a1, input_variableName		
	la 	$a2, 21
	syscall
	
	beq 	$a1, -2, quit
	
	bnez 	$a1, getvariableName_invalid
	nop
	
	la 	$s0, input_variableName		# s0 la dia chi cua ki tu dau tien		
	add 	$t0, $zero, $zero			# bien chay t0 = i = 0
	add	$t1, $s0, $t0			# t1 la dia chi cua tung ki tu
	lb	$s1, 0($t1)			# s1 la gia tri cua tung ki tu
	jr	$ra

next:
	add  	$t1, $s0, $t0			
	lb	$s1, 0($t1)			# update bien chay t0 va gia tri cua s1 (cua ki tu thu i)	
	jr	$ra

check1stCharacter:
	li 	$t4, 'A'	
	slt 	$t3, $s1, $t4			# s1 < t4 thi t3 = 1
	bne 	$t3, $zero, error
	nop
	
	li 	$t4, 'Z'
	sle	$t3, $s1, $t4
	bne 	$t3, $zero, checked
	nop
	
	li 	$t4, '_'
	beq	$s1, $t4, checked
	nop
	
	li 	$t4, 'a'	
	slt 	$t3, $s1, $t4			# s1 < t4 thi t3 = 1
	bne 	$t3, $zero, error
	nop
	
	li 	$t4, 'z'
	sle 	$t3, $s1, $t4			# s1 <= t4 => t3 =1 
	bne 	$t3, $zero, checked
	nop

check:
	li 	$t4, 'A'	
	slt 	$t3, $s1, $t4			# s1 < t4 thi t3 = 1
	bne 	$t3, $zero, checknumber	
	nop
	
	li 	$t4, 'Z'
	sle	$t3, $s1, $t4
	bne 	$t3, $zero, checked
	nop
	
	li 	$t4, '_'
	beq	$s1, $t4, checked
	nop
	
	li 	$t4, 'a'	
	slt 	$t3, $s1, $t4			
	bne 	$t3, $zero, error
	nop
	
	li 	$t4, 'z'
	sle 	$t3, $s1, $t4			# s1 <= t4 => t3 = 1 
	bne 	$t3, $zero, checked
	nop			
	
checknumber:
	li	$t4, '0'
	slt 	$t3, $s1, $t4			#s1 < t4 thi t3 = 1
	bne 	$t3, $zero, error	
	nop
	
	li 	$t4, '9'
	sle	$t3, $s1, $t4
	bne	$t3, $zero, checked
	nop

	j	error
	nop

checked:
	addi	$t0, $t0, 1			# update i= i+1 
	beq	$t0, 20, print
	j	next
	nop
					
error:	
	bne    	$s1,10,increase
	nop
	sb 	$0, input_variableName($t0)
	li	$v0, 4
	la	$a0, variableName_FALSE_1
	syscall
	li	$v0, 4
	la	$a0, input_variableName
	syscall
	li	$v0, 4
	la	$a0, variableName_FALSE_2
	syscall
	j 	confirmDialog
	nop

increase :
	addi	$t0,$t0,1
	add  	$t1,$s0,$t0			
	lb	$s1,0($t1)
	j	error
	nop

quit:
	li 	$v0, 10
	syscall
	
#-----------------------------------------------------------------------
#	$a0 contains value of user-chosen option
#		0: Yes
# 		1: No
#		2: Cancel
#-----------------------------------------------------------------------
confirmDialog:
	li 	$v0, 50
	la 	$a0, ConfirmDialog_MESSAGE
	syscall
	beq 	$a0, $zero, main
	nop
	li 	$v0, 10
	syscall
