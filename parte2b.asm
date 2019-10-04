.data

 contador : .word 1
 acumulador: .word 1
 dos: .word 2
 
 numerofactorial: .word 1 #ESTE PUEDE VARIAR SEGUN EL USUARIO QUIERA 
 
.text	
	.globl main
	main:
	lw $t3, contador 
	lw $t4, numerofactorial
	lw $t5, acumulador
	
	
	jal factorial 
	
	
	
	
		
			
				
					
						
							
							
									
#fUCNION FACTORIAL										
factorial:		
	#casos base									
	beqz $t4, f 
	beq $t4, 1 ,one 
	beq $t4, 2, t
																								
	loop:
	#si el contador es IGUAL al factorial estamos ok
	beq $t3, $t4, exit
	#sino

	move $t0, $t3
	move $t1, $t5
	addi $t3,$t3,1 #Aaumentamos el contador en 1
	jal multiplicacion #llamamos a nuestra funcion multiplicar 
	
	move $t5,$t2 #desplazamos el primer resultado a otro registro y seguimos con el loop
	j loop
	
	

#---------------#
.globl multiplicacion
multiplicacion:



#verifica cual de los dos factores es el mayor, si es el primero se salta a la etiqueta primeromayor
bgt $t0,$t1, primeromayor
#de no ser asi trabajaremos con el segundo factor, ya que el que sea menor ira disminuyendo hasta llegar a cero
#mientras que el mayor se va sumando consigo mismo las veces que sea necesario hasta que el otro factor sea cero.
 segundomayor:
 beqz $t0, final
#RESTAMOS UNO AL PRIMER FACTOR
 addi $t0, $t0, -1
 add $t2, $t2, $t1
 j segundomayor
 
primeromayor:
beqz $t1,final 
#restamos uno al segundo factor
addi $t1, $t1 , -1
add $t2, $t2, $t0
j primeromayor


#llamado final para cualquiera de las dos opciones anteriores y uego retornamos a la siguiente instruccion, almacenada en $ra
 final:
 	#li $v0, 1
 	#move $a0, $t2
	jr $ra
	
	
	
exit:
	#movemos algunos resultados de registros y llamamos nuevamente a la funcion multiplicacion
	#debido a que el factorial nos llegaba hasta el 3 como minimo numero (error de algoritmo), no el 2, asi que multiplicamos por 2 nuestro ultim oresultado
	move $t0, $t5
	lw $t1, dos
	jal multiplicacion
	sub $t2, $t2,$t0
	#llamamos por pantalla
	li $v0,1
	move $a0,$t2
	
	syscall 
	
	j fin

one:
	addi $t2,$t2,1
	li $v0,1
	move $a0,$t2
	
	syscall
	j fin
	
f:
	addi $t2,$zero,0
	li $v0,1
	move $a0,$t2
	
	syscall
	j fin

t:
	addi $t2,$zero,2
	li $v0,1
	move $a0,$t2
	syscall
	
	
	
fin:
	
