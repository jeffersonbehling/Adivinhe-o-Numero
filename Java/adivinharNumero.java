import java.util.Scanner;

public class adivinharNumero {
	public static void main(String[] args) {
		Scanner entrada = new Scanner(System.in);

		boolean acertou = false;
		int numSorteado = (int) (Math.random() * 10);
		int numTentativas = 0;

		while(acertou == false){
			if(numTentativas == 5){
				System.out.println("Você perdeu!!!");
				acertou = true;
			}
			System.out.println("Número de Tentativas: "+ numTentativas);
			System.out.println("Digite um número: ");
			int numero = entrada.nextInt();
			if(numero == numSorteado){
				System.out.println("PARABÉNS!!! Você acertou o número. O número era "+ numSorteado);
				acertou = true;
			}else{
				numTentativas++;
				if(numSorteado < numero){
					System.out.println("\nO número é menor.\n");
				}else{
					System.out.println("\nO número é maior.\n");
				}
				System.out.println("Errou!!! Tente novamente.\n\n");
			}
		}

	}
}