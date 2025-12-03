# TP6 — Les Librairies Statiques et Dynamiques : compilation Makefile
_<u>**Définition**</u> : une librairie est un ensemble de fonctions déjà compliquées qu'on peut directement utiliser_


> ➡️ _Les Librairies statiques (.a) sont **INTEGREES directement dans le programmme** exécutable au moment de la compilation. Lors de la phase de d'édition des liens, le code des fonctions utilisées dans la librairie est copié intégralement dans le fichier exécutable final. Le programme n'aura plus besoin de la librairie une fois compilé_

> ➡️ _Les Librairies dynamiques (.so) (Shared Library) encore appelées "Librairies Partagées" ne sont pas intégrées dans le programme à la compilation (contrairement aux libs statiques), elle sont plutôt **CHARGEES au moment de l'exécution**. Pour cela un fichier ***.so (Linux)/.dll(windows)/.dylib(MacOs)*** doit être présent dans le système à l'exécution. Les libs dynamiques sont présents dans plusieurs programmes modernes (Python,etc), car elles permettent de mettre à jour le code sans recompiler l'exécutable, mais aussi elles permettent de réduire la taille de l'éxecutable_

### 1.Compilation

`make static` # Compile la version statique <br>
`make dynamic` # Compile la version dynamique

### 2. Exécution

`make run-static` # Exécute le programme statique <br>
`make run-dynamic` # Exécute le programme dynamique

### 3. Néttoyage
`make clean`         # Supprime tous les fichiers générés

## REMARQUE ! : Recours à la Compiltion conditionnelle
Dans cette exercie au début, en voulant compiler le main j'ai du me confronter à une erreur (voir image ci-dessous) car mon main incluait au départ la directive dynamique et statique, et exigait la compliation de chacun des 2 directive dans sa phase de pré-processing  : je ne pouvais donc lancer ni la lib statique ni la lib dynamique (séparemment) ayant exigent le run de l'autre, meme si la compilation de base produisait les outpout nécessaire.

Pour résoudre le problème, avoir avoir cherché l'origin de mon erreur, j'ai compris qui'l fallait passer par directives conditionnelle du préprocessuer , c'est à dire qu'au moment du préprocessing on incluerait uniquement l'entête de la librairie qu'on veut lancer (soit statique ou dynamique) 

La mise en place de cette solution passe donc par des structures telle que  :
* `#ifdef / #ifndef / #endif`
* `#if / #elif / #else`

Dans cette exercie on l'utilisera comme suit :

```C
// pour inclure la directive statique uniquement si on est dans l'appel a la lib statique
#if USE_STATIC
#include "../lib/staticCalculatrice/staticCalc.h" 
#endif

// pour inclure la directive dynamique uniquement si on est dans l'appel a la lib dynamque
#if USE_DYNAMIC
#include "../lib/dynamicCalculatrice/dynamicCalc.h"
#endif
```

**error avant utilisation de la compilation conditionnelle**

![alt text](/img/no-conditonal_compil.png)

**fixe - code run : avec compilaiton conditionnelle**
![alt text](/img/with-conditonal_compil.png)


## Résultat
![alt text](/img/result.png)