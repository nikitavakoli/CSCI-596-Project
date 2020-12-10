CC=mpic++
CFLAGS=-O9 -std=c++11

all: cliqueParallel cliqueShared

cliqueParallel : KClique_DistributedMemory.c
	$(CC) $(CFLAGS) KClique_DistributedMemory.c -o cliqueParallel -fopenmp

cliqueShared : KClique_SharedMemory.c
	$(CC) $(CFLAGS) KClique_SharedMemory.c -o cliqueShared -fopenmp

clean:
	rm cliqueParallel
	rm cliqueShared
