# TP6 — Lbrairies statiques et dynamqiues : compilation manuelle

_<u>**Définition**</u> : une librairie est un ensemble de fonctions déjà compliquées qu'on peut directement utilisées_

## A - LIBRAIRIES STATIQUES 
> _Les Librairies statiques sont intégrées directement dans le programmme exécutbale au moment de la compilation_


### 1. compiler la lib (calc.c -> calc.o)

> - Aller dans le répertoir /staticCalculatrice :  `cd src/lib/staticCalculatrice`
> - Lancer la commande : `gcc -std=c2x -pedantic -Wall -Wextra -Werror -c calc.c -o ../../build/calc.o`

### 2. Créer l'archive de la lib statique (.a) avec la commande ar

> - Toujours dans répertoir `src/lib/staticCalculatrice`
> - Lancer la commande : `ar rcs libStaticCal.a ../../build/calc.o`

Où :

- `r` : pour insérer les fichiers
- `c` : pour créé l'archive si elle n'existe pas
- `s` : pour créé un index équivalent à (randlib)

### 3. Compliation de main.c -> main.o

> - Aller dans le rep /app/ : `cd ../../src/app/`
> - Lancer `gcc -std=c2x -pedantic -Wall -Wextra -Werror -c main.c -o ../build/main.o`

### 4. Lier main avec la lib statique

> - Toujours Dans `src/app/`
> - Lancer `gcc ../build/main.o -L../lib/staticCalculatrice -lStaticCal -o ../bin/prog`

Où :

- l'option `-L` pour "Library Path" : désigne le nom du dossier où sont définit les librairies, le GCC doit les checher à ce niveau. Ici c'est le chmin `src/lib/staticCalculatrice/`

- L'option `-l` pour "Librairy name" : désigne le nom de la librairie que le GCC doit checher à lier, ici c'est la lib `libStaticCal.a`

### 5. Lancer le proggramme 
`../bin/prog`


## B - LIBS. DYNAMIQUES