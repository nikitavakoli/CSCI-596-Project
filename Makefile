CC=mpic++
CD=g++
CFLAGS= -O3 -std=c++11 -fopenmp

all: cliqueParallel cliqueShared

cliqueParallel : KClique_DistributedMemory.c
	$(CC) $(CFLAGS) KClique_DistributedMemory.c -o cliqueParallel 

cliqueShared : KClique_SharedMemory.c
	$(CD) $(CFLAGS) KClique_SharedMemory.c -o cliqueShared 

clean:
	rm cliqueParallel
	rm cliqueShared
