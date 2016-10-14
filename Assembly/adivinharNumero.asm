.data
	cabecalho: .asciiz "\n\n===== Adivinhe o Número =====\n\n DICA: Número está entre 0 e 10\n\n"
	numero: .asciiz "\nDigite o Primeiro Numero: "
	messageErrorMenor: .asciiz "\n\nO número é maior!\nErrou! Tente novamente.\n\n"
	messageErrorMaior: .asciiz "\n\nO número é menor!\nErrou! Tente novamente.\n\n"
	messageAcertou: .asciiz "\n\nParabéns! Você acertou o número. O número era: "
	numeroSorteado: .asciiz "Número sorteado: "
	messagePerdeu: .asciiz "\nVocê perdeu!!! Atingiu o limite de tentativas!\n"
	numeroTentativas: .asciiz "\nNúmero de Tentativas: "
	
.text
	# Mostra cabeçalho
	li $v0, 4
	la $a0, cabecalho
	syscall

	# Mostra o numero sorteado 
    	li $v0, 4
    	la $a0, numeroSorteado
    	syscall
    	
	li $a1, 10  # Aqui você definir $a1 o máximo 
   	li $v0, 42  # gera numeros random
    	syscall
    	
    	li $v0, 1   # 1 print integer
    	# COLOQUEI ESSA LINHA, PQ NA LINHA 20, SE FOR EXECUTAR PASSO A PASSO ELE ADD NO REGISTRADOR $a0 O VALOR SORTEADO
    	add $t3, $a0, $zero 
    	syscall
	
digiteNovamente:

	# Verifica o numero de tentativas (maximo 5)
	beq $t7, 5, perdeu
		
	# Mostra a mensagem p/ user
	li $v0, 4
	la $a0, numero
	syscall
	
	# Pega o numero que o usuario digitou
	li $v0, 5
	syscall
	
	# Armazena o resultado no $t0
	move $t0, $v0
		
	# Verifica de o Numero sorteado é igual ao numero digitado
	bne $t0,$t3, errou
	beq $t0,$t3, acertou
	
	# Verifica de o Numero sorteado é diferente do numero digitado
	
	errou:
		# Incremento no numero de tentativas
		addi $t7, $t7, 1
		# Mostra mensagem messageErrouMenor
		slt $t1, $t0, $t3
		beq $t1, 1, errorMenor
		beq $t1, 0, errorMaior
		syscall
	
	errorMenor:
		li $v0, 4
		la $a0, messageErrorMenor
		syscall
		jal digiteNovamente
		
	errorMaior:
		li $v0, 4
		la $a0, messageErrorMaior
		syscall
		jal digiteNovamente
		
	# Mostra Mensagem se Acertou
	acertou:
		li $v0, 4
		la $a0, messageAcertou
		syscall
	
	# Mostra o numero
	li $v0, 1
	move $a0, $t0
	syscall

	perdeu:
		li $v0, 4
		la $a0, messagePerdeu
		syscall
