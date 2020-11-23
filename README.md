CSCI 596 - Final Project: Distributed Memory K-Clique Enumeration

![CSCI596](https://bitbucket.com/fuccichris/CSCI596Project/raw/master/files/graph_clique.png)

Members: Christopher Fucci, Kartik Lakhotia, Niki Tavakoli

Project Goal: We are exploring shared + distributed memory parallelism to enumerate cliques

Approach: 
Store graph on every node; the vertex set will then be divided into several small subsets. There will be a common queue of the subset IDs, and each node pulls an index from the queue and computes the cliques for that subset of vertices

Methods utilized: MPI_Send/Receive, MPI_Get/Put, and MPI_Win_lock
