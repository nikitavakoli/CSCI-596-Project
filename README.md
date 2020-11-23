CSCI 596 - Final Project: Distributed Memory K-Clique Enumeration

Members: Christopher Fucci, Kartik Lakhotia, Niki Tavakoli

Project Goal: We are exploring shared + distributed memory parallelism to enumerate cliques

Approach: 
1. Store graph on every node. 
2. The vertex set will then be divided into several small subsets. There will be a common queue of the subset IDs.
3. Each node pulls an index from the queue and computes the cliques for that subset of vertices

Methods utilized:
1. MPI_Send/Receive
2. MPI_Get/Put
3. MPI_Win_lock
