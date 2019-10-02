.data
 primermensaje: .asciiz "Entregue el numero a calcular el factorial: "
 segundomensaje: .ascii "\n El factorial es : "
 numero: .word 0
 respuesta: .word 0


.text

.globl main 
main: 
#leemos el numero ingresado por el usuario
li $v0, 4
la $a0, primermensaje
syscall
 li $v0, 5
 syscall
 
 sw $v0, numero
 #llamado a la funcion factorial
 lw $a0, numero
 jal factorial
 sw $v0, respuesta
 
 #mostramos el resultado
	li $v0, 4
	la $a0 , segundomensaje
	syscall

 	 li $v0, 1
	  lw $a0, respuesta
	syscall 
	  li $v0, 10	
	  syscall
  


.globl factorial
factorial:
	subu $sp,$sp,8
	sw $ra, ($sp)
	sw $s0, 4($sp)
	
	#caso base
	li $v0,1
	beq $a0, 0, hacerfactorial
	
	#encontrarFactorial 
	move $s0, $a0
	sub $a0, $a0, 1
	jal factorial
	
	#muliplicacion, cambiar poe el algoritmo de la parte 2a
	mul $v0, $s0 , $v0
	
	hacerfactorial:
		lw $ra, ($sp)
		lw $s0, 4($sp)
		addu $sp, $sp,8
		jr $ra
		
		
	
	
	
	
	