#include <math.h>
#include <stdio.h>

void decimal_to_binary() {
  printf("\nIngresa el número decimal: ");

  int decimal = 0;
  scanf("%d", &decimal);

  printf("Número en formato binario (complemento a 2): ");
  for (int i = 31; i >= 0; i--) {
    int digit = (decimal >> i) & 1;
    printf("%d", digit);
  }

  printf("\n");
}

void binary_to_decimal() {
  printf("\nIngresa el número binario: ");

  int binary = 0;
  scanf("%d", &binary);

  int decimal = 0;
  for (int i = 0; i < 7; i++) {
    int digit = (binary >> i) & 1;
    int result = digit * pow(2, i);
    printf("result: %d", result);
    decimal += result;
  }
  printf("Número binario en decimal: %d", decimal);

  printf("\n");
}

void random_number() {}

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
  }

  return 0;
}
