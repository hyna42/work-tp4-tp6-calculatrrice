# TP6 — Les Librairies Statiques et Dynamiques : compilation Makefile
_<u>**Définition**</u> : une librairie est un ensemble de fonctions déjà compliquées qu'on peut directement utiliser_


> ➡️ _Les Librairies statiques (.a) sont **INTEGREES directement dans le programmme** exécutable au moment de la compilation. Lors de la phase de d'édition des liens, le code des fonctions utilisées dans la librairie est copié intégralement dans le fichier exécutable final. Le programme n'aura plus besoin de la librairie une fois compilé_

> ➡️ _Les Librairies dynamiques (.so) (Shared Library) encore appelées "Librairies Partagées" ne sont pas intégrées dans le programme à la compilation (contrairement aux libs statiques), elle sont plutôt **CHARGEES au moment de l'exécution**. Pour cela un fichier ***.so (Linux)/.dll(windows)/.dylib(MacOs)*** doit être présent dans le système à l'exécution. Les libs dynamiques sont présents dans plusieurs programmes modernes (Python,etc), car elles permettent de mettre à jour le code sans recompiler l'exécutable, mais aussi elles permettent de réduire la taille de l'éxecutable_

### 1.Compilation

`make ` # Compile tout le programme avec les libs staique et partagées <br>
`make run` # lance le programme

### 3. Néttoyage
`make clean`         # Supprime tous les fichiers générés dans src/build et dans src/bin 


## TESTS D'EXECUTION
![alt text](/src/assets/execution_test.png)