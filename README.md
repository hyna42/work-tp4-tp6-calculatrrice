# TP6 — Les Librairies Statiques et Dynamiques : compilation Makefile

_<u>**Définition**</u> : une librairie est un ensemble de fonctions déjà compliquées qu'on peut directement utilisées_


> ➡️ _Les Librairies statiques sont intégrées directement dans le programmme exécutbale au moment de la compilation_

> ➡️ _Les Librairies dynamiques (Shared Library) ou Librairies Partagées ne sont pas intégrées au programme, elle sont chargées au moment de l'exécution. Un .so (Linux)/.dll(windows)/.dylib(MacOs) doit être présent dans le système à l'exécution. Les libs dynamiques permettent sont présents dans plusieurs programmes modernes, car elles permettent de màj le code sans recompiler l'exécutable, mais aussi elles permettent de réduire la taille de l'éxecutable_

### 1.Compilation

`make static` # Compile la version statique <br>
`make dynamic` # Compile la version dynamique

### 2. Exécution

`make run-static` # Exécute le programme statique <br>
`make run-dynamic` # Exécute le programme dynamique

### 3. Néttoyage
`make clean`         # Supprime tous les fichiers générés