# TP4 — Compilation **avec Makefile** (Calculatrice)

## Objectif
Compiler et exécuter la calculatrice **exclusivement via Makefile**.

## Structure
```
.
├─ main.c         # menu + I/O + switch
├─ functions.h    # prototypes: add/sub/mul/diviz (float)
├─ functions.c    # implémentations
├─ Makefile       # règles de build
└─ README.md
```

## Cibles du Makefile
| Cible        | Fait quoi ?                                   | Sorties attendues                    |
|--------------|-----------------------------------------------|--------------------------------------|
| `all` (def.) | Compile & link tout                           | `prog`                               |
| `run`        | `all` puis exécute                            | lance `./prog`                       |
| `clean`      | Nettoie                                       | supprime `prog` `*.o` `*.i` `*.s`    |
| `pprocess`   | Étape 1 : préprocessing                       | `main.i`, `functions.i`              |
| `compil`     | Étape 2 : compilation → assembleur            | `main.s`, `functions.s`              |
| `assemb`     | Étape 3 : assemblage → objets                 | `main.o`, `functions.o`              |
| `link`       | Étape 4 : édition des liens                   | `prog`                               |

> Les règles sont **par fichier** (`%.i`, `%.s`, `%.o`).

## Explications par étape

### 1) `pprocess` — Préprocessing → `*.i`
- Remplace les `#include`, développe les `#define`, supprime les commentaires.
- `*.i` : code C **préprocessé** (en-têtes intégrés, macros développées).

### 2) `compil` — Compilation → `*.s`
- Transforme le C préprocessé en **code assembleur**.
- `*.s` : code assembleur lisible (instructions/labels/directives).

### 3) `assemb` — Assemblage → `*.o`
- Convertit l’assembleur en **objets** binaires.
- `*.o` : code machine non lié + symboles/relocations.

### 4) `link` — Édition des liens → `prog`
- Résout les symboles entre objets et produit l’**exécutable**.
- `prog` : binaire final prêt à être lancé.

## Ce que déclenche `make all`
1. Construit les `*.o` à partir des `*.c`.
2. Lie **tous** les objets (`main.o` + `functions.o`) → `prog`.
3. Recompile uniquement les fichiers modifiés.

## Utilisation
```bash
# construire
make           # ou: make all

# exécuter
make run

# étapes 
make pprocess  # produit *.i
make compil    # produit *.s
make assemb    # produit *.o
make link      # lie les *.o en prog

# nettoyer
make clean
```

## Options (dans le Makefile)
`-std=c2x -pedantic -Wall -Wextra -Werror`

