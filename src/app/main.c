#include <stdio.h>
#include <stdlib.h>

// ============================================================
//       INCLUDES CONDITIONNELS (selon Makefile)
// ============================================================
#if USE_STATIC
#include "../lib/staticCalculatrice/staticCalc.h"
#endif

#if USE_DYNAMIC
#include "../lib/dynamicCalculatrice/dynamicCalc.h"
#endif


// ============================================================
//                 FONCTIONS STATIQUES
// ============================================================
#if USE_STATIC
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
#endif


// ============================================================
//                 FONCTIONS DYNAMIQUES
// ============================================================
#if USE_DYNAMIC
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
#endif


// ============================================================
//                         MAIN
// ============================================================
int main(void) {
    int opType, a, b;

    // ----- On ne demande PLUS la librairie : elle est fixée par compilation -----

    printf("Type d'operation: addition(1) - soustraction(2) - multiplication(3) - division(4): ");
    if (scanf("%d", &opType) != 1) { puts("Entree invalide"); return 1; }

    printf("Choisir deux entiers (format exact avec virgule, ex: 5,3): ");
    if (scanf(" %d , %d", &a, &b) != 2) {
        puts("Entree invalide: utilisez le format 5,3");
        return 1;
    }

    // ----- Exécution selon le mode défini au Makefile -----
#if USE_STATIC
    do_static(opType, a, b);
#endif

#if USE_DYNAMIC
    do_dynamic(opType, a, b);
#endif

#if USE_STATIC && USE_DYNAMIC
    do_static(opType, a, b);
    do_dynamic(opType, a, b);
#endif

    return 0;
}
