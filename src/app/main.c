#include <stdio.h>
#include <stdlib.h>
#include "../lib/calc.h"

int main(void)

{
    int opType, a, b;

    printf("Type d'opération : addition (1) - soustraction (2) - multiplication (3) - division (4) : ");

    scanf("%d", &opType);

    printf("Choisir deux entiers pour effectuer l'opération : ");
    scanf("%d, %d", &a, &b);

    switch (opType)
    {
    case 1:
        printf("La somme de %d + %d  =  %d \n", a, b, staticAddition(a, b));
        ;
        break;
    case 2:
        printf("La soustraction de %d - %d  =  %d \n", a, b, staticSoustraction(a, b));
        ;
        break;

    case 3:
        printf("La multiplication de %d * %d  =  %d \n", a, b, staticMultiplication(a, b));
        ;
        break;

    case 4:
        printf("La division de %d / %d  =  %.2f \n", a, b, staticDivision(a, b));
        ;
        break;

    default:
        puts("Opération inconnu");
        break;
    }

    return 0;
}