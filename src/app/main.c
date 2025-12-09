#include <stdio.h>
#include <stdlib.h>
#include "../lib/dynamicCalculatrice/dynamicCalc.h"
#include "../lib/staticCalculatrice/staticCalc.h"

static void do_static(int op, int a, int b) {
    switch (op) {
        case 1: printf("[STATIC]  %d + %d = %d\n", a, b, staticAddition(a, b)); break;
        case 2: printf("[STATIC]  %d - %d = %d\n", a, b, staticSoustraction(a, b)); break;
        case 3: printf("[STATIC]  %d * %d = %d\n", a, b, staticMultiplication(a, b)); break;
        case 4:
            if (b == 0) { puts("[STATIC]  Division par zero interdite"); break; }
            printf("[STATIC]  %d / %d = %.2f\n", a, b, staticDivision(a, b));
            break;
        default: puts("[STATIC]  Operation inconnue"); break;
    }
}

static void do_dynamic(int op, int a, int b) {
    switch (op) {
        case 1: printf("[DYNAMIC] %d + %d = %d\n", a, b, dynamicAddition(a, b)); break;
        case 2: printf("[DYNAMIC] %d - %d = %d\n", a, b, dynamicSoustraction(a, b)); break;
        case 3: printf("[DYNAMIC] %d * %d = %d\n", a, b, dynamicMultiplication(a, b)); break;
        case 4:
            if (b == 0) { puts("[DYNAMIC] Division par zero interdite"); break; }
            printf("[DYNAMIC] %d / %d = %.2f\n", a, b, dynamicDivision(a, b));
            break;
        default: puts("[DYNAMIC] Operation inconnue"); break;
    }
}

int main(void) {
    int libChoice, opType, a, b;

    printf("Choisir la librairie: statique(1) / dynamique(2) / les deux(3): ");
    if (scanf("%d", &libChoice) != 1) { puts("Entree invalide"); return 1; }

    printf("Type d'operation: addition(1) - soustraction(2) - multiplication(3) - division(4): ");
    if (scanf("%d", &opType) != 1) { puts("Entree invalide"); return 1; }

    printf("Choisir deux entiers (format exact avec virgule, ex: 5,3): ");

    if (scanf(" %d , %d", &a, &b) != 2) {
        puts("Entree invalide: utilisez le format 5,3");
        return 1;
    }

    switch (libChoice) {
        case 1: do_static(opType, a, b); break;
        case 2: do_dynamic(opType, a, b); break;
        case 3: do_static(opType, a, b); do_dynamic(opType, a, b); break;
        default: puts("Choix de librairie inconnu"); return 1;
    }
    return 0;
}
