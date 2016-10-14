import java.util.Scanner;

public class adivinharNumero {
	public static void main(String[] args) {
		Scanner entrada = new Scanner(System.in);

		boolean acertou = false;
		int numSorteado = (int) (Math.random() * 10);

		while(acertou == false){
			System.out.println("Digite um número: ");
			int numero = entrada.nextInt();
			if(numero == numSorteado){
				System.out.println("PARABÉNS!!! Você acertou o número. O número era "+ numSorteado);
				acertou = true;
			}else{
				System.out.println("Errou!!! Tente novamente.\n\n");
			}
		}

	}
}