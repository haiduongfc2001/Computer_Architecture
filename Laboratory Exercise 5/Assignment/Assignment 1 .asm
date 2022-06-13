.data
test: .asciiz "Hello World, I'm Do Hai Duong 20194528"
.text
	li $v0, 4
 	la $a0, test
 	syscall