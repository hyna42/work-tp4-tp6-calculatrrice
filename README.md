# TP6 — Les Librairies Statiques et Dynamiques : compilation manuelle

_<u>**Définition**</u> : une librairie est un ensemble de fonctions déjà compliquées qu'on peut directement utiliser_

## A - LIBRAIRIES STATIQUES

> ➡️ _Les Librairies statiques (.a) sont **INTEGREES directement dans le programmme** exécutable au moment de la compilation. Lors de la phase de d'édition des liens, le code des fonctions utilisées dans la librairie est copié intégralement dans le fichier exécutable final. Le programme n'aura plus besoin de la librairie une fois compilé_

### 1.Compilation de main.c -> main.o

> - Aller dans le rep /app : `cd app/`
> - Lancer `gcc -std=c2x -pedantic -Wall -Wextra -Werror -c main.c -o ../build/main.o`

### 2. compiler la lib (calc.c -> calc.o)

> - Aller dans le répertoir /lib : `cd ../lib/`
> - Lancer la commande : `gcc -std=c2x -pedantic -Wall -Wextra -Werror -c calc.c -o ../build/calc.o`

### 3. Créer l'archive (la lib statique) (.a) avec la commande ar

> - Toujours dans /lib
> - Lancer la commande : `ar rcs staticCalculatrice/libStaticCal.a ../build/calc.o`

Où :

- `r` : pour insérer les fichiers
- `c` : pour créér l'archive si elle n'existe pas
- `s` : pour créér un index équivalent à (randlib)


### 4. Lier main avec la lib statique

> - Toujours dans /lib
> - Lancer `gcc ../build/main.o -L./staticCalculatrice -lStaticCal -o ../bin/prog`

Où :

- l'option `-L` pour "Library Path" : désigne le nom du dossier où sont définit les librairies, le GCC doit les chercher à ce niveau. Dans notre exemple il s'agit du chemin suivant : `src/lib/staticCalculatrice/`

- L'option `-l` pour "Librairy name" : désigne le nom de la librairie que le GCC doit chercher à lier, ici il s'agit de la lib `libStaticCal.a`

### 5. Lancer le proggramme
`../bin/prog`

## B - LIBRAIRIES DYNAMIQUES

> ➡️ _Les Librairies dynamiques (.so), Shared Library encore appelées "Librairies Partagées" ne sont pas intégrées dans le programme à la compilation (contrairement aux libs statiques), elle sont plutôt **CHARGEES au moment de l'exécution**. Pour cela un fichier ***.so (Linux)/.dll(windows)/.dylib(MacOs)*** doit être présent dans le système à l'exécution. Les libs dynamiques sont présents dans plusieurs programmes modernes (Python,etc), car elles permettent de mettre à jour le code sans recompiler l'exécutable, mais aussi elles permettent de réduire la taille de l'éxecutable_

### 1. Compilation de main.c -> main.o
> - Dans /app `cd app/` - lancer  `gcc -std=c2x -pedantic -Wall -Wextra -Werror -c main.c -o ../build/main.o`

### 2. Compiler la lib avec l'option `-fPIC` (Position Independant Code) : calc.c -> calc.o
> - Aller dans /lib : `cd ../lib/`
> - Lancer : `gcc -std=c2x -pedantic -Wall -Wextra -Werror -fPIC -c calc.c -o ../build/calc.o`

### 3. Créer la librairie dynamique .so : `libDynamicCal.so` (je suis sur la distribution WSL, donc Linux = .so)
> - Toujours dans /lib : `gcc -shared -o ./dynamicCalculatrice/libDynamicCal.so ../build/calc.o`


### 4. Lier le .so dans le main
> - Toujours dans /lib :  `gcc ../build/main.o -L./dynamicCalculatrice -lDynamicCal -o ../bin/prog`

***NB : ici ne pas oublier de faire `export LD_LIBRARY_PATH=$LD_LIBRARY_PATH` depuis `lib/dynamicCalculatrice/`avant d'exécuter le programme***

### 5. Exécuter le proggramme
`../bin/prog`
