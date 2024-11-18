#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void convert_dec_to_bin(int decimal) {
  for (int i = 31; i >= 0; i--) {
    int digit = (decimal >> i) & 1;
    printf("%d", digit);
  }
}

void decimal_to_binary() {
  printf("\nIngresa el número decimal: ");

  int decimal = 0;
  scanf("%d", &decimal);

  printf("Número en formato binario (complemento a 2): ");
  convert_dec_to_bin(decimal);

  printf("\n");
}

void binary_to_decimal() {
  printf("\nIngresa el número binario: ");

  char binary[8];
  scanf("%s", binary);

  int decimal = 0;
  for (int i = 0; i < 8; i++) {
    decimal = decimal * 2 + (binary[i] - '0');
  }
  printf("Número binario en decimal: %d", decimal);

  printf("\n");
}

void random_number() {
  srand(time(NULL)); // initialize seed for rand()
  int random_number =
      rand() % (50 - 10 + 1) + 10; // get random number between 50 and 10
  printf("\nNúmero aleatorio\n");
  printf("Decimal: %d\n", random_number);
  printf("Binario: ");
  convert_dec_to_bin(random_number);
  printf("\n");
}

void show_menu() {
  printf("1. Convertir número decimal a binario\n");
  printf("2. Convertir número binario a decimal\n");
  printf("3. Generar un número aleatorio\n");
}

int main() {
  printf("Bienvenido al conversor de números... y algo más\n\n");

  show_menu();

  int option = 0;
  printf("Elige una opción: ");
  scanf("%d", &option);

  if (option == 1) {
    decimal_to_binary();
  } else if (option == 2) {
    binary_to_decimal();
  } else if (option == 3) {
    random_number();
  } else {
    printf("Elige una opción válida\n");
    return 1;
  }

  return 0;
}
