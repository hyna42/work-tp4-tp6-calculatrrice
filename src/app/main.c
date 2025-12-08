#include <stdio.h>
#include "../lib/dynamicCalculatrice/dynamicCalc.h"
#include "../lib/staticCalculatrice/staticCalc.h"

int main(void)
{

    puts("********## CALCULATRICE : LIBRAIRIES STATIQUES ET PARTAGEES ##********");

    unsigned int opType = 0;
    int a = 0, b = 0;

    do
    {
        printf("Choisir le type de l'opération\n------------------------------ \nAddition (1)\nSoustraction (2)\nMultiplication (3)\nDivision (4)\n------------------------------\n: ");
        scanf("%u", &opType);

        if (opType > 4 || opType < 1)
        {

            printf("Type d'opération invalide, le nombre doit etre compris entre 1 et 4\n");
        }

    } while (opType < 1 || opType > 4);

    printf("Choisir deux entiers (format exacte avec virgule, ex 5,3 ) : ");
    scanf("%d, %d", &a, &b);

    switch (opType)
    {
    case 1:
        printf("L'addition de %d + %d = %d\n", a, b, dynamicAddition(a, b));
        break;
    case 2:
        printf("La soustraction de %d - %d = %d\n", a, b, dynamicSoustraction(a, b));

        break;

    case 3:
        printf("La multiplication de %d * %d = %d\n", a, b, staticMultiplication(a, b));
        break;

    case 4:
        if (b == 0)
        {
            printf("Erreur : Division par 0 impossible !");
            break;
        }

        printf("La division de %d par %d = %.2f\n", a, b, staticDivision(a, b));
        break;

    default:
        break;
    }
    return 0;
}