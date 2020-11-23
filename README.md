CSCI 596 - Final Project: Distributed Memory K-Clique Enumeration

Members: Christopher Fucci, Kartik Lakhotia, Niki Tavakoli

Project Goal: We are exploring shared + distributed memory parallelism to enumerate cliques

Approach: 
1. Store graph on every node. 
1. The vertex set will then be divided into several small subsets. There will be a common queue of the subset IDs.
1. Each node pulls an index from the queue and computes the cliques for that subset of vertices

Methods utilized:
- MPI_Send/Receive
- MPI_Get/Put
- MPI_Win_lock
