.text
	li 	$s1, 0 		# gán i = 0
	
loop: 	add 	$s1, $s1, $s4 	#i=i+step
	add 	$t1, $s1, $s1 	#t1=2*s1
	add 	$t1, $t1, $t1 	#t1=4*s1
	add 	$t1, $t1, $s2 	#t1 store the address of A[i]
	lw 	$t0, 0($t1) 	#load value of A[i] in $t0
	add 	$s5, $s5, $t0 	#sum=sum+A[i]
	slt 	$t8, $s3, $s1	# if i <= n
	beq 	$t8, $zero, loop 	#if i != n, goto loop