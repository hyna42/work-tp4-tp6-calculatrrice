# --- Options ---
CC      = gcc
CFLAGS  = -std=c2x -pedantic -Wall -Wextra -Werror
LDFLAGS = 
# rpath: pour exécuter sans exporter LD_LIBRARY_PATH
RPATH   = -Wl,-rpath,'$$ORIGIN/../lib/dynamicCalculatrice'

# --- Dossiers ---
BUILD   = src/build
BIN     = src/bin
STATIC  = src/lib/staticCalculatrice
DYNAMIC = src/lib/dynamicCalculatrice

# --- Sources ---
MAIN    = src/app/main.c
FSTATIC = $(STATIC)/staticCalc.c
FDYN    = $(DYNAMIC)/dynamicCalc.c

# --- Dossiers de sortie  ---
$(shell mkdir -p $(BUILD) $(BIN) $(STATIC) $(DYNAMIC))

# --- Cible par défaut : src/bin/calc
all: $(BIN)/calc

# --- Objets ---
$(BUILD)/main.o: $(MAIN)
	@$(CC) $(CFLAGS) -I$(STATIC) -I$(DYNAMIC) -c $< -o $@

$(BUILD)/staticCalc.o: $(FSTATIC)
	@$(CC) $(CFLAGS) -c $< -o $@

$(BUILD)/dynamicCalc.o: $(FDYN)
	@$(CC) $(CFLAGS) -fPIC -c $< -o $@

# --- Librairie statique ---
$(STATIC)/libStaticCal.a: $(BUILD)/staticCalc.o
	@ar rcs $@ $<
	@echo "✅ lib statique prête: $@"

# --- Librairie dynamique ---
$(DYNAMIC)/libDynamicCal.so: $(BUILD)/dynamicCalc.o
	@$(CC) -shared -o $@ $<
	@echo "✅ lib dynamique prête: $@"

# --- Binaire unique liant les deux libs ---
$(BIN)/calc: $(BUILD)/main.o $(STATIC)/libStaticCal.a $(DYNAMIC)/libDynamicCal.so
	@$(CC) $(BUILD)/main.o \
		-L$(STATIC) -lStaticCal \
		-L$(DYNAMIC) -lDynamicCal \
		$(RPATH) $(LDFLAGS) -o $@
	@echo "🎯 Binaire prêt: $@"

# --- Exécution ---
run: $(BIN)/calc
	@./$<

# --- Nettoyage ---
clean:
	@rm -f $(BUILD)/*.o
	@rm -f $(STATIC)/*.a
	@rm -f $(DYNAMIC)/*.so
	@rm -f $(BIN)/*
	@echo "✔ Nettoyage terminé."

.PHONY: all run clean
