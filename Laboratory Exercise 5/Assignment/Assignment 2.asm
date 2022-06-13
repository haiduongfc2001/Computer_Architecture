.data
string1:	.asciiz "The sum of "
string2: 	.asciiz " and "
string3: 	.asciiz " is "
.text
	li $s0, 2019
	li $s1, 4528
# Print "The sum of "
	li $v0, 4
	la $a0, string1
	syscall
# Print $s0 value
	li $v0, 1
	add $a0, $zero, $s0
	syscall
# Print " and "
	li $v0, 4
	la $a0, string2
	syscall
# Print s1 value
	li $v0, 1
	add $a0, $zero, $s1
	syscall
# Print " is "
	li $v0, 4
	la $a0, string3
	syscall
# Print sum of $s0 and $s1
	li $v0, 1
	add $a0, $s0, $s1
	syscall
	
	
	
	