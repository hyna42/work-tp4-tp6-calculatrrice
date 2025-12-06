# TP7 — CMake : compilation du projet (calculatrice)
<u>**Définition**</u> : **CMAKE** est un système de construction (Build System) Multiplateforme qui permet de génèrer des fichiers de configuration pour d'autres outils de compilation telsque le `Makefile` afin de compiler le projet partout avec n'importe quel outil, sans toucher au code.


1. Création de `CMakeLists.txt` dans src/app

2. création du dossier build  dans src/ afin de respecter le standard CMake `out-of-source build`  L'avantage de cette méthode c'est qu'on peut supprimer build/ pour tout nettoyer, tout en gardant le code source propre

3. Construction des fichiers sources du projet comportant depuis /build avec la commande `cmake ../app`

Cette commande permet de créer entre autres :
- Le dossier `CMakeFiles/`
- Le fichier `CMakeCache.txt`
- Le ficher `Makefile`

![alt text](/assets/cmake_init.png)

4. Dans /build , on lance la commande `make` pour générre l'éxécutable **`app`** pour lancer le projet.

![alt text](/assets/create-exec.png)

On peut ensuite tester le programme avec la commande `./app` pour afficher notre ***'hello world'***
![alt text](/assets/test-run-app.png)
