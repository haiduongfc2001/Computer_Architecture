start:
	addi 	$s1, $zero, -3		# i = -3
	addi 	$s2, $zero, 2		# j = 2
	add 	$s3, $s1, $s2		# s3 = i + j
	slt	$t0, $zero, $s3		# i + j <= 0
	bne 	$t0, $zero, else	# branch to else if i + j > 0
	addi 	$t1, $t1, 1		# then part: x = x + 1
	addi 	$t3, $zero, 1		# z = 1
	j 	endif			# skip "else" part
else: 	addi 	$t2, $t2, -1		#begin else part: y = y + 1
	add 	$t3, $t3, $t3		# z = 2 * z
endif:
