.eqv MONITOR_SCREEN 0x10010000 #Dia chi bat dau cua bo nho man hinh
.eqv GREEN 0x0000FF00
.text
 	li $k0, MONITOR_SCREEN #Nap dia chi bat dau cua man hinh
 
 	li $t0, GREEN
 	sw $t0, 0($k0)
 	sw $t0, 4($k0) 
 	sw $t0, 8($k0) 
 	sw $t0, 12($k0)
 	sw $t0, 16($k0) 
 	sw $t0, 20($k0)
 	sw $t0, 32($k0) 
 	sw $t0, 56($k0) 
 	sw $t0, 64($k0) 
 	sw $t0, 92($k0) 
 	sw $t0, 96($k0) 
 	sw $t0, 124($k0) 
 	sw $t0, 128($k0) 
 	sw $t0, 156($k0) 
 	sw $t0, 160($k0) 
 	sw $t0, 188($k0) 
 	sw $t0, 192($k0) 
 	sw $t0, 216($k0) 
 	sw $t0, 224($k0) 
 	sw $t0, 228($k0) 
 	sw $t0, 232($k0) 
 	sw $t0, 236($k0) 
 	sw $t0, 240($k0) 
 	sw $t0, 244($k0) 
 	nop
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
