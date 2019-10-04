.data
#LAB2 DE ORGA PARTE 2A - SEBASTIAN ORDENES
	primerfactor: .word 14
	segundofactor: .word 5
	contador: .word 0

.text
	.globl main
		
		lw $t0, primerfactor
		lw $t1, segundofactor
		lw $t2, contador
		
		
		
	main:
	jal multiplicacion
	
	syscall
	j exit 
	
	







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
 	li $v0, 1
 	move $a0, $t2
	jr $ra

  
exit:
 
