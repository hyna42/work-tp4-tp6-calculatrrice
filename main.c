#include <stdio.h>
#include <stdlib.h>
#include "functions.h"

int main(void)

{

    int choice;
    float a, b, result;

    puts("*** CALCULATRICE ***");
    puts("1 → Addition");
    puts("2 → Soustraction");
    puts("3 → Multiplication");
    puts("4 → Division");

    while (choice < 1 || choice > 4)
    {
        /* code */
        printf("Choisissez une opération (1-4) : ");
        scanf("%d", &choice);
    }

    printf("Entrez les deux nombres : ");
    scanf("%f,%f", &a, &b);

    switch (choice)
    {
    case 1:
        result = add(a, b);
        break;

    case 2:
        result = sub(a, b);
        break;

    case 3:
        result = mul(a, b);
        break;

    case 4:
        result = diviz(a, b);
        break;
    }

    printf("Resultat = %.2f\n", result);
    return 0;
}