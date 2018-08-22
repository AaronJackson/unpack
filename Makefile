CC=gcc
CFLAGS=-W -Wall -g -fPIC --shared

all:
	$(CC) $(CFLAGS) -o libunpack.so unpack.c
