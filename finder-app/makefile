# Makefile for writer.c

CC = gcc
TARGET = writer
SRCS = writer.c
OBJS = $(SRCS:.c=.o)

ifeq ( $(CROSS_COMPILE), "aarch64-none-linux-gnu-" )
	CC := $(CROSS_COMPILE)gcc
endif


.PHONY: all clean

all: $(TARGET)

# $@ corresponds to target name

$(TARGET): $(OBJS)
	@$(CC) -o $@ $^

# dependencies for each .o file it must correspond to .c file
%.o: %.c
	@$(CC) -c -o $@ $<

clean:
	@rm -f $(TARGET) $(OBJS)