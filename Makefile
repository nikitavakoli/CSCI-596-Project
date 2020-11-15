CC=g++
CFLAGS=-O9 -std=c++11

all: nodeParallel

nodeParallel : DDegColNodeParallel.c
	$(CC) $(CFLAGS) DDegColNodeParallel.c -o DDegColNodeParallel -fopenmp


clean:
	rm DDegColNodeParallel
