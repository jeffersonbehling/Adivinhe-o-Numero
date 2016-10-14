.data
	cabecalho: .asciiz "\n\n===== Maior ou Menor? =====\n\n"
	numero: .asciiz "\nDigite um Numero: "
	messageMenor: .asciiz "\nO número é menor!"
	messageMaior: .asciiz "\nO número é maior!"
	
.text

	# Mostra cabeçalho
	li $v0, 4
	la $a0, cabecalho
	syscall

	li $a1, 10  # Aqui você definir $a1 o máximo 
   	li $v0, 42  # gera numeros random
    	syscall
    	
    	# Mostra o numero sorteado 
    	li $v0, 1   # 1 print integer
    	# COLOQUEI ESSA LINHA, PQ NA LINHA 20, SE FOR EXECUTAR PASSO A PASSO ELE ADD NO REGISTRADOR $a0 O VALOR SORTEADO
    	add $t3, $a0, $zero 
    	syscall
	
digiteNovamente:
	
	# Mostra a mensagem p/ user
	li $v0, 4
	la $a0, numero
	syscall
	
	# Pega o numero que o usuario digitou
	li $v0, 5
	syscall
	
	# Armazena o resultado no $t0
	move $t0, $v0
	
		
			
	
   	slt $t1, $t0, $t3
	beq $t1, 1, menor	
	beqz $t1, maior
	
		maior:
			li $v0, 4
			la $a0, messageMaior
			j sair
			
		menor:
			li $v0, 4
			la $a0, messageMenor
			j sair
	
	sair:
	syscall
