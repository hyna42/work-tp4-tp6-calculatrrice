############################################
# OPTIONS GENERALES
############################################

CC = gcc
CFLAGS = -std=c2x -pedantic -Wall -Wextra -Werror

# Dossiers
BUILD   = src/build
BIN     = src/bin
STATIC  = src/lib/staticCalculatrice
DYNAMIC = src/lib/dynamicCalculatrice

# Fichiers sources
MAIN = src/app/main.c
FDYNAMIC = src/lib/dynamicCalculatrice/dynamicCalc.c
FSTATIC = src/lib/staticCalculatrice/staticCalc.c

# Création des dossiers si inexistants
$(shell mkdir -p $(BUILD) $(BIN))

############################################
#             A - COMPILATION LIB STATIQUE
############################################

# ajouter le flag pour activer le code statique
static: CFLAGS += -DUSE_STATIC
static: $(BIN)/prog_static

$(BUILD)/main_static.o: $(MAIN)
	@$(CC) $(CFLAGS) -c $(MAIN) -o $(BUILD)/main_static.o

$(BUILD)/calc_static.o: $(FSTATIC)
	@$(CC) $(CFLAGS) -c $(FSTATIC) -o $(BUILD)/calc_static.o

$(STATIC)/libStaticCal.a: $(BUILD)/calc_static.o
	@ar rcs $(STATIC)/libStaticCal.a $(BUILD)/calc_static.o

$(BIN)/prog_static: $(BUILD)/main_static.o $(STATIC)/libStaticCal.a
	@$(CC) $(BUILD)/main_static.o -L$(STATIC) -lStaticCal -o $(BIN)/prog_static
	@echo "✅ Compilation statique terminée."

run-static: $(BIN)/prog_static
	@./$(BIN)/prog_static

############################################
#             B - COMPILATION LIB DYNAMIQUE
############################################

# ajouter le flag pour activer le code dynamique
dynamic: CFLAGS += -DUSE_DYNAMIC
dynamic: $(BIN)/prog_dynamic

$(BUILD)/main_dynamic.o: $(MAIN)
	@$(CC) $(CFLAGS) -c $(MAIN) -o $(BUILD)/main_dynamic.o

$(BUILD)/calc_dynamic.o: $(FDYNAMIC)
	@$(CC) $(CFLAGS) -fPIC -c $(FDYNAMIC) -o $(BUILD)/calc_dynamic.o

$(DYNAMIC)/libDynamicCal.so: $(BUILD)/calc_dynamic.o
	@$(CC) -shared -o $(DYNAMIC)/libDynamicCal.so $(BUILD)/calc_dynamic.o

$(BIN)/prog_dynamic: $(BUILD)/main_dynamic.o $(DYNAMIC)/libDynamicCal.so
	@$(CC) $(BUILD)/main_dynamic.o -L$(DYNAMIC) -lDynamicCal -o $(BIN)/prog_dynamic
	@echo "✅ Compilation dynamique terminée."

run-dynamic: $(BIN)/prog_dynamic
	@LD_LIBRARY_PATH=$(DYNAMIC) ./$(BIN)/prog_dynamic

############################################
#                  CLEAN
############################################

clean:
	@rm -f $(BUILD)/*.o
	@rm -f $(STATIC)/*.a
	@rm -f $(DYNAMIC)/*.so
	@rm -f $(BIN)/*
	@echo "✔ Nettoyage terminé."

.PHONY: static dynamic run-static run-dynamic clean
