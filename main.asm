# Number Converter

.data

welcome_string: .asciiz "Bienvenido al conversor de números... y algo más\n\n"
show_menu_string: .asciiz "1. Convertir un número decimal a binario\n2. Convertir un número binario a decimal\n3. Generar un número aleatorio\n"
choose_option: .asciiz "Elige una opción: "
invalid_option: .asciiz "Elige una opción válida\n"
decimal: .asciiz "\nDecimal: "
binary: .asciiz "\nBinario: "
ask_decimal: .asciiz "\nIngresa el número decimal: "
ask_binary: .asciiz "\nIngresa el número binario: "
binary_in_decimal: .asciiz "\nNúmero binario en decimal: "
decimal_in_binary: .asciiz "\nNúmero decimal en binario (complemento a 2): "
random_number_s: .asciiz "\nNúmero aleatorio\n"
buffer: .space 9
newline: .asciiz "\n"

.text
main:	
	li $v0, 4
	la $a0, welcome_string
	syscall
	
	jal show_menu
	
	li $v0, 4
	la $a0, choose_option
	syscall
	
	li $v0, 5
	syscall
	
	li $t0, 1
	li $t1, 2
	li $t2, 3
	bne $v0, $t0, second_option
	jal decimal_to_binary
	j exit
second_option:
	bne $v0, $t1, third_option
	jal binary_to_decimal
	j exit
third_option:
	bne $v0, $t2, error_message
	jal random_number
	j exit
error_message:
	li $v0, 4
	la $a0, invalid_option
	syscall
	li $v0, 17
	li $a0, 2
	syscall
exit: 
	li $v0, 10
	syscall
	
##########
	

show_menu:
	li $v0, 4
	la $a0, show_menu_string
	syscall
	jr $ra
	
##########
	
decimal_to_binary:
	la $a0, ask_decimal
    	li $v0, 4                   
    	syscall                     

    	li $v0, 5                  
    	syscall
    	
    	move $t0, $v0              

    	la $a0, decimal_in_binary
    	li $v0, 4                 
    	syscall

	move $a0, $t0
	li $v0, 35
	syscall
	
    	la $a0, newline
    	li $v0, 4                  
    	syscall
    	
	jr $ra

##########

binary_to_decimal:
	la $a0, ask_binary
    	li $v0, 4                 
    	syscall                   

    	la $a0, buffer
    	li $a1, 9                  
    	li $v0, 8                  
    	syscall

    	la $t0, buffer              
    	li $t1, 0                  

for_bin2dec:
	lb $t2, 0($t0)         
        beqz $t2, end_bin2dec        
        sub $t2, $t2, 48       
        mul $t1, $t1, 2         
        add $t1, $t1, $t2       
        addi $t0, $t0, 1       

        j for_bin2dec

end_bin2dec:
	la $a0, binary_in_decimal
	li $v0, 4
	syscall

        move $a0, $t1
        li $v0, 1
        syscall

        la $a0, newline
        li $v0, 4                  
        syscall
        
        jr $ra

##########

random_number:
	li $v0, 4
	la $a0, random_number_s
	syscall
	
	li $v0, 30
	syscall
	
	li $v0, 42
	li $a1, 50
	syscall
	
	add $t0, $a0, $zero
	
	li $v0, 4
	la $a0, decimal
	syscall
	
	add $a0, $t0, $zero
	
	li $t2, 1
	li $t0, 10
	slt $t1, $a0, $t0
	bne $t1, $t2, not_less_than_ten
	addi $a0, $a0, 10
not_less_than_ten:
	move $t0, $a0

	li $v0, 1
	syscall
	
	li $v0, 4
	la $a0, binary
	syscall
	
	li $v0, 35
	move $a0, $t0
	syscall