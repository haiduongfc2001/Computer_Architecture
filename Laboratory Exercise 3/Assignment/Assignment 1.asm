start:
	addi 	$s1, $zero, 4528		# i = 4528
	addi 	$s2, $zero, 1		# j = 1
	addi   	$s3, $zero, 9		# z = 1
	slt 	$t0, $s2, $s1 		# j < i
	bne 	$t0, $zero, else 	# branch to else if j < i
	addi 	$s1, $s1, 1 		# then part: x = x+1
	addi 	$s3, $zero, 1 		# z = 1
	j 	endif 			# skip “else” part
else: 	addi 	$s2, $s2, -1 		# begin else part: y = y-1
	add 	$s3, $s3, $s3 		# z = 2 * z
endif:
