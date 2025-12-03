# TP6 — Les Librairies Statiques et Dynamiques : compilation manuelle

_<u>**Définition**</u> : une librairie est un ensemble de fonctions déjà compliquées qu'on peut directement utiliser_

## A - DEFINITIONS

> ➡️ _Les Librairies statiques (.a) sont **INTEGREES directement dans le programmme** exécutable au moment de la compilation. Lors de la phase de d'édition des liens, le code des fonctions utilisées dans la librairie est copié intégralement dans le fichier exécutable final. Le programme n'aura plus besoin de la librairie une fois compilé_


> ➡️ _Les Librairies dynamiques (.so), Shared Library encore appelées "Librairies Partagées" ne sont pas intégrées dans le programme à la compilation (contrairement aux libs statiques), elle sont plutôt **CHARGEES au moment de l'exécution**. Pour cela un fichier ***.so (Linux)/.dll(windows)/.dylib(MacOs)*** doit être présent dans le système à l'exécution. Les libs dynamiques sont présents dans plusieurs programmes modernes (Python,etc), car elles permettent de mettre à jour le code sans recompiler l'exécutable, mais aussi elles permettent de réduire la taille de l'éxecutable_

## B - APPLICATION

### 1.Compilation des objets (.o)

> - **<u>main</u>** : dans app/ : `gcc -std=c2x -pedantic -Wall -Wextra -Werror -c main.c -o ../build/main.o`

> - **<u>Lib statique</u>** : dans lib/staticCalculatrice/ : `gcc -std=c2x -pedantic -Wall -Wextra -Werror -c staticCalc.c -o ../../build/staticCalc.o`

> - **<u>Lib dynamique</u>** : dans lib/dynamicCalculatrice/ : `gcc -std=c2x -pedantic -Wall -Wextra -Werror -c dynamicCalc.c -o ../../build/dynamicCalc.o`

### 2. Construire les librairies

> - **librairie statique** lib/: `ar rcs staticCalculatrice/libStaticCal.a ../build/staticCalc.o`

> - **librairie dynamique** lib/: `gcc -shared -fPIC -o dynamicCalculatrice/libDynamicCal.so ../build/dynamicCalc.o`


Où :

- `r` : pour insérer les fichiers
- `c` : pour créér l'archive si elle n'existe pas
- `s` : pour créér un index équivalent à (randlib)
- `-shared` : produit une bibliothèque partagée (.so) pouvant être liée dynamiquement à un exécutable
- `-fPIC`: génère du code position-indépendant (PIC), nécessaire pour les bibliothèques partagées afin qu'elles puissent être chargées à n'importe quelle adresse mémoire.

### 4. Lier l'exécutable (main.o) avec les deux librairies depuis la racine /build

```bash
gcc main.o -L../lib/staticCalculatrice -L../lib/dynamicCalculatrice \
  -Wl,-Bstatic -lStaticCal -Wl,-Bdynamic -lDynamicCal \
  -Wl,-rpath,'$ORIGIN/../lib/dynamicCalculatrice' \
  -o ../bin/prog   
```

> - TIP : on peut vérifier (à partir du /build si le .so a bien été réoslu) avec la commande `ldd ../bin/prog`

![alt text](/src/assets/so-build.png)

AVEC :
- `-L` -L../lib/staticCalculatrice et -L../lib/dynamicCalculatrice indique au linker où chercher les bibliothèques lors de la phase de lien
- `-Wl,-Bstatic -lStaticCal` , intègrer la lib ***libStaticCal.a*** dans l'exécutable
    - `-Wl` : passe les options suivantes au linker (pas au compilateur).
    - `-Bstatic` : force le lien statique pour les bibliothèques suivantes.
    - `-lStaticCal` : lie la bibliothèque libStaticCal.a (statique) trouvée dans le répertoire indiqué par -L
- `-Wl,-Bdynamic -lDynamicCal` : permet de charger la lib ***libDynamicCal.so*** au moment de de l'exécution :
    - `-Bdynamic` : repasse en mode lien dynamique
    - `-lDynamicCal` : lie la bibliothèque libDynamicCal.so
- `-Wl,-rpath,'$ORIGIN/../lib/dynamicCalculatrice'` : permet de définir un chemin d’exécution (runtime path) intégré dans l’exécutable afin de pouvoir distribuer l'exécutable avec ses .so sans configurer le système :
    - `$$ORIGIN` : il s'agit du répertoire où se trouve l’exécutable (../bin/)
Le programme saura où trouver ***libDynamicCal.so*** au démarrage, **<u>même sans variable LD_LIBRARY_PATH**<u>.
- -o ../bin/prog   : spécifer le nom de l'exécutable de sortie

### 5. Excécuter le proggramme
`../bin/prog`

## TETS
![alt text](/src/assets/test.png)
