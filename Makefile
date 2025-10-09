#### varibales ####
CC      = gcc
FLAGS  = -std=c2x -pedantic -Wall -Wextra -Werror
BIN     = prog

SRCS    = main.c functions.c

PREP    = $(SRCS:.c=.i)
ASM     = $(SRCS:.c=.s)
OBJS    = $(SRCS:.c=.o)

#########################################################


PHONY: all run clean pprocess compil assemb link

all: $(BIN)

$(BIN): $(OBJS)
	$(CC) $(CFLAGS) $^ -o $@

# 1) Preprocess: .c -> .i
%.i: %.c
	$(CC) $(CFLAGS) -E $< -o $@

# 2) Compile: .i -> .s
%.s: %.i
	$(CC) $(CFLAGS) -S $< -o $@

# 3) Assemble: .s -> .o
%.o: %.s
	$(CC) $(CFLAGS) -c $< -o $@

# Cibles "pédagogiques" par phase
pprocess: $(PREP)
compil:   $(ASM)
assemb:   $(OBJS)
link:     $(BIN)

run: all
	./$(BIN)

clean:
	rm -f $(BIN) $(PREP) $(ASM) $(OBJS)