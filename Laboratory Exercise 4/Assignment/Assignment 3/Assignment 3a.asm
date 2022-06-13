.text 
	li 	$s1, 4528	# test value
	bltz	$s1, Convert	# neu sl < 0
	add 	$s0, $s1, 0	# luu result vao $s0
	j 	Exit
Convert:
	xori	$s0, $s1, 0xffffffff
	add 	$s0, $s0, 1
Exit: 