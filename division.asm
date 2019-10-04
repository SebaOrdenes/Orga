.data
	dividendo: .word 50  #MODIFICAR ESTE
	divisor: .word 8 	#MODIFICAR ESTE
	n1: .float 1
	n100: .float 100
	mensaje1: .asciiz "."
	
	#parte 2c correspondiente a la division con 3 decimales aproximados 
	

.text


	lw $t0,dividendo
	lw $t1, divisor
	lwc1 $f1, n1
	
	
	
	
	division:
	
	
	sub $t0,$t0,$t1
	addi $a0,$a0,1 #definimos el contador para el reultado
	add.s $f2, $f2,$f1
	beq $t0,0, fin #si el dividendo es cero significa que la disivion fue exacta
	blt $t0,$t1,sumar100veces #si el dividendo es menor al divisor, se procederia a la prte decimal
	
	j division
	
	

sumar100veces:
addi $t2,$t2,1 #contador
addu  $t3,$t3,$t0 #en t3 quedará la parte del resto y lo "multiplicamos" por 100
bne $t2,1000,sumar100veces
j divisionresto

divisionresto: #aqui dividiremos 

	sub $t3,$t3,$t1
	addi $a1,$a1,1 #definimos el contador para el reultado
	add.s $f0,$f0,$f1
	#sub.s $f4, $f4,$f1
	blt $t3,$t1,fin #si el dividendo es menor al divisor, tenemos almenos 2 decimales 
	
	j divisionresto
	

	
	
	


fin:

li $v0,1

syscall 

li $v0,4
#li $v0,1
la $a0, mensaje1
syscall
li $v0,1
move $a0,$a1
 syscall







		
	
	
	
	
	
	
	
	



