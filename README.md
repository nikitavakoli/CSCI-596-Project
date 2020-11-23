# CSCI 596 - Final Project: Distributed Memory K-Clique Enumeration

![Cliques in a toy graph](graph.png)

Members: Christopher Fucci, Kartik Lakhotia, Niki Tavakoli

## Introduction
We are exploring shared + distributed memory parallelism to enumerate cliques

## Approach
We use a distributed task queue from where compute nodes pull tasks when idle.
Each task represents a subset of vertices from where cliques will be explored.

Methods utilized: MPI_Send/Receive, MPI_Get/Put, and MPI_Win_lock

## Optimizations
1. Dynamic Scheduling
2. Truss and runtime degree based approaches to filter the search space.
3. Cyclic vertex partitioning for better load balancing
4. Hybrid Shared-memory + Distributed-memory parallelism

## Future Work
Currently, we target small graphs and deep cliques. Hence, graph is replicated on all nodes.
In the future, we want to partition the graph and use work stealing for load balancing. 


