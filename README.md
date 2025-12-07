# TP7 — CMake : compilation du projet (calculatrice)

<u>**Définition**</u> : **CMAKE** est un système de construction (Build System) Multiplateforme qui permet de génèrer des fichiers de configuration pour d'autres outils de compilation telsque le `Makefile` afin de compiler le projet partout avec n'importe quel outil, sans toucher au code.

## 1. Création du `CMakeLists.txt` principal à la racine :

```CMake
cmake_minimum_required(VERSION 3.10)
project(calculatrice C)

add_subdirectory(lib/dynamicCalculatrice)
add_subdirectory(lib/staticCalculatrice)

add_executable(app src/main.c)

target_link_libraries(app calcStatic calcDynamic)
```

Ici on :

- définit la version minimale de CMake ;
- déclare le projet calculatrice en langage C ;
- ajoute les deux sous-répertoires contenant les bibliothèques ;
- crée l’exécutable app à partir de src/main.c ;
- lie l’exécutable avec les bibliothèques calcStatic et calcDynamic.

## 2. Créer la lib. statique `calcStatic.a`

![alt text](/assets/staticLib.png)
Ici on :

- crée une bibliothèque statique (calcStatic.a) à partir du fichier staticCal.c ;
- rend le dossier contenant staticCal.h accessible à l'exécutable via target_include_directories ;
- permet à l’exécutable d’utiliser les fonctions de **multiplication** et **division** définies dans cette lib.

## 3. Créer la lib. dynamique `calcDynamic.so`

![alt text](/assets/dynamicLib.png)
Ici on :

- crée une bibliothèque dynamique (calcDynamic.so) basée sur dynamicCal.c ;
- expose le dossier contenant dynamicCal.h pour que l'exécutable puisse l'inclure ;
- fournit les fonctions d’**addition** et de **soustraction** via cette lib au moment de l’exécution.

## 4. Générer les fichiers de configurations :

- crééer un dosier isolé build pour tous les fichiers générés par CMake : `mkdir build`
- entrer dans le dossier : `cd build`
- Exécuter `cmake ..` pour analyser le projet et produire le Makefile

## 5. Copilation duprojet avec la commande `make`

Ici on :

- lance la compilation à partir du Makefile généré par CMake ;
- construit les **bibliothèques** (.a et .so) ainsi que **l’exécutable** `app`

## 6. Lancer le projet `./app`

## TETS D'EXECUTIONS

1. Etat initial (avant build/)
   ![alt text](/assets/test00.png)
2. On créée le dossier build
   ![alt text](/assets/test01.png)
3. Aller dans `/build` puis executer `cmake ..` pour produire le Makefile
   ![alt text](/assets/test02.png)
4. Compiler le projet avec la commande `make` pour générer l'exécutable `app`
   ![alt text](/assets/test03.png)
5. Lancer le projet avec la commande `./app` puis faires des test sur les 4 opérations
![alt text](/assets/test04.png)
