.data
	#PARTE 1 LABORATORIO 2 DE ORGA- SEBASTIAN ORDENES 

	mensaje1: .asciiz "Por favor ingrese el primer entero: \n"
	mensaje2: .asciiz "Por favor ingrese el segundo entero: \n"
	mensaje3: .asciiz "El numero minimo es: "
	


.text
	#imprimiendo el primer mensaje
 	li $v0, 4
 	la $a0, mensaje1
 	syscall
 	
 	#esperando la respuesta del usuario
 	li $v0, 5
 	syscall
 	#movemos el valor ingresado en v0 a un registro temporal
 	move $t0, $v0
 	
 	#imprimimos el segundo mensaje
 	li $v0,4
 	la $a0, mensaje2
 	syscall
 	#esperamos su respuesta
 	li $v0,5
 	syscall 
 	#lo movemos nuevamente a otro regisro temporal
 	move $t1, $v0
 	
 	#imprimimos el ultimo mensaje
 	li $v0, 4
 	la $a0,mensaje3
 	syscall
 	
 	#si el primer numero es mayor se salta a la etiqueta para imprimirlo, si no, se avanza y se imprime el otro
 	bgt $t0,$t1, print
 	
 	#imprimimos el resultado si el primero es mayor
 	li $v0, 1
 	move $a0,$t0
 	syscall
 	j exit
 
 	print:
 	#imprimimos el resultado si el segundo es mayor
 	li $v0,1
 	move $a0, $t1
 	syscall
 	j exit
 	
 	exit:
 	
 	
 	