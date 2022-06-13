.text
start:
	li 	$s1, 2147483647
	li 	$s2, -4528
	li 	$t0,0 		#No Overflow is default status
	addu 	$s3,$s1,$s2 	# s3 = s1 + s2
	xor 	$t1,$s1,$s2 	#Test if $s1 and $s2 have the same sign
	
	bltz 	$t1,EXIT 	#If not, exit
	xor 	$t2,$s3,$s1
	bltz	$t2, OVERFLOW	
	j	EXIT	
	
OVERFLOW:
	li 	$t0,1 		#the result is overflow
EXIT: