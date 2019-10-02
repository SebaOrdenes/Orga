.data
#LAB2 DE ORGA PARTE 2A - SEBASTIAN ORDENES
.text
addi $t0, $t0, 5  #PRIMER FACTOR 
addi $t1, $t1, 90 #SEGUNDO FACTOR 
addI $t2, $t2, 0 #REGISTRO TEMPORAL DONDE IREMOS ALMACENANDO EL RESULTADO
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


#llamado final para cualquiera de las dos opciones anteriores y una impresion por pantalla
 final:
 li $v0,1
 move $a0,$t2
 syscall
  
 