.data
	A: .word 2, 1, 3, 6, 5, 7
	Aend: .word
	B: .word 1, 2, 5, 6, 5, 7
	Bend: .word
	MessageTrue: .asciiz "areSimilar(a, b) = true"
	MessageFalse: .asciiz "areSimilar(a, b) = false"
.text
main:
	la $t0, A #load address A[0]
	la $t2, Aend
	sub $t0, $t2, $t0 #$t0 = length A*4
	
	la $t1, B #load address B[0]
	la $t3, Bend
	sub $t1, $t3, $t1 #$t1 = length B*4

	bne $t0, $t1, false # if length not equal

	addi $s1, $0, 0 #swap
	addi $s2, $0, 0 #av
	addi $s3, $0, 0 #bv
	addi $s4, $0, 0 #check save av
	addi $s5, $0, 0 #check save bv

#for
	add $s7, $0, $0 # jump = 0
for: 
	beq $s7, $t0, true # if jump = 4*length break for
	
	lw $t2, A($s7) #get A[i]
	lw $t3, B($s7) #get B[i]

	bne $t2, $t3, khacnhau #if a not equal b
	
tiepfor:
	addi $s7, $s7, 4 # jump +4
	j for # back to for

khacnhau: 
	or $t4, $s4, $s5 # av == null || bv == null
	
	beq $t4, 0, them
	
	addi $t5, $0, 0 #check av !== B[i]
	addi $t6, $0, 0 #check bv !== A[i]
	
	bne $s2, $t3, checkav #check av !== B[i]
	j jump1
	
checkav:
	addi $t5, $0, 1 #av !== B[i] is true
	
jump1:
	bne $s3, $t2, checkbv #check bv !== A[i]
	j jump2
	
checkbv:
	addi $t6, $0, 1 #bv !== A[i] is true
	
jump2:
	or $t7, $t5, $t6 #av !== b[i] || bv !== a[i]
	or $t8, $t7, $s1 #swap || av !== b[i] || bv !== a[i]
	
	beq $t8, 1, false
	
	addi $s1, $0, 1 #swap = 1
	j tiepfor

them:
	add $s2, $0, $t2 #av = A[i]
	add $s3, $0, $t3 #bv = B[i]
	
	addi $s4, $0, 1 #saved av
	addi $s5, $0, 1 #saved bv
	j tiepfor

true:
	li $v0, 4
	la $a0, MessageTrue
	syscall
	
	li $v0, 10 #exit
	syscall
	
false:
	li $v0, 4
	la $a0, MessageFalse
	syscall
