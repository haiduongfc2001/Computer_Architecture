.data
	String:		.space 100		
	getvariableName_msg:	.asciiz "Enter the variableName:"
	getvariableName_invalid_msg:	.asciiz "Invalid variableName.\nPlease re-enter 0 < variableName <= 20 (charater)"
	msg_fail : .asciiz " VariableName(name) = fail "
	msg_true :.asciiz " VariableName(name) = true"
#-------------------------------------------------------------
main:	jal	getvariableName 		# get the variableName
	nop
	jal 	check1stcharacter
	nop
	bne    	$s1,$zero,checkalphabet			#(b?ng 0 thì k?t thúc chu?i ) 
	nop
	li	$v0,4
	la	$a0,msg_true
	syscall
	li	$v0,10
	syscall
	
getvariableName_invalid:
	li 	$v0, 55		# MessageDialog: error message
	la 	$a0, getvariableName_invalid_msg
	li 	$a1, 0
	syscall
getvariableName:	
	li	$v0, 54					# input 
	la	$a0, getvariableName_msg
	la	$a1, String			#a1 l?u ??a ch? c?a string 
	la	$a2, 21				# 21 = MAX_NAME_LEN + 1, bc of '\n'
	syscall  
	
	bnez 	$a1, getvariableName_invalid	# Nh?p l?i bi?n <20 kí t? 
	nop
	
					
	la 	$s0,String			#s0 là ??a ch? ô ??u tiên 
	add 	$t0,$zero,$zero			# bi?n ch?y t0 =0
	add	$t1,$s0,$t0			#t1 là ??a ch? c?a t?ng kí t? 
	lb	$s1,0($t1)			#s1 là giá tr? c?a t?ng kí t? 
	jr	$ra
Next :
	add  	$t1,$s0,$t0			
	lb	$s1,0($t1)			#update  bi?n ch?y t và giá tr? s 
	jr	$ra
checkalphabet :
	li 	$t4,'A'	
	slt 	$t3,$s1,$t4			# s1 < t4 thì t3 = 1
	bne 	$t3,$zero,checknumber	
	nop
	li 	$t4,'Z'
	sle	$t3,$s1,$t4
	bne 	$t3,$zero,checked
	nop
	li 	$t4,'_'
	beq	$s1,$t4,checked
	nop
	li 	$t4,'a'	
	slt 	$t3,$s1,$t4			# s1 < t4 thì t3 = 1
	bne 	$t3,$zero,error
	nop
	li 	$t4,'z'
	sle 	$t3,$s1,$t4			# s1 <= t4 => t3 =1 
	bne 	$t3,$zero,checked
	nop	
check1stcharacter:
	lb 	$s1,0($s0)
	li 	$t4,'A'	
	slt 	$t3,$s1,$t4			# s1 < t4 thì t3 = 1
	bne 	$t3,$zero,error
	nop
	li 	$t4,'Z'
	sle	$t3,$s1,$t4
	bne 	$t3,$zero,checked
	nop
	li 	$t4,'_'
	beq	$s1,$t4,checked
	nop
	li 	$t4,'a'	
	slt 	$t3,$s1,$t4			# s1 < t4 thì t3 = 1
	bne 	$t3,$zero,error
	nop
	li 	$t4,'z'
	sle 	$t3,$s1,$t4			# s1 <= t4 => t3 =1 
	bne 	$t3,$zero,checked
	nop	
checknumber:
	li	$t4,'0'
	slt 	$t3,$s1,$t4			#s1 <t4 thì t3 =1
	bne 	$t3,$zero,error	
	nop
	li 	$t4,'9'
	sle	$t3,$s1,$t4
	bne	$t3,$zero,checked
	nop
	j	error
	nop
	


checked:
	addi	$t0,$t0,1
	j	Next
	nop
error :
	li 	$v0,4
	la      $a0,msg_fail
	syscall
	li	$v0, 10		#exit
	syscall