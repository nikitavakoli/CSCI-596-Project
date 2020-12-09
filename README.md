# CSCI 596 - Final Project: Distributed Memory K-Clique Enumeration

![Cliques in a toy graph](graph.png)

Members: Christopher Fucci, Kartik Lakhotia, Niki Tavakoli
Fall 2020

## Introduction
The purpose of this project is to explore shared and distributed memory parallelism to enumerate deep cliques. Cliques are very frequently used in graph mining to find structures of interest in the graph
and have many different useful applications. A starting vertex is typically selected whose neighbors are then found. Then those neighbors explore their neighbors, and so on. Through this method, we aim to build
cliques around the starting vertex.
There are previous works in this area which focus on the parallelization of clique counting and optimizations for filtering the search spaces in the clique counting. However, there is no work currently that incorporates clique counting in a distributed method without increasing the memory overhead hugely. 
Cliques are instead computed only for moderately sized graphs which can easily fit into the memory of each node.


Thus, we aim to parallelize the problem and reduce the amount of remote distributed queries we must achieve and instead localize the queries with a shared memory system. 


## Approach
A graph is stored on every node;e each of these graphs has around a hundred million edges, so we aim to extract deep cliques from them. There
is a central queue of the subset ID's stored on a master node to which each every other node has access to. This central queue is easily implemented using *MPI_Get/Put*, and we use a
distributed task queue from where computed nodes pull tasks when idle. Each node pulls a pointer from the queue that conveys the induced subset of vertices that the machine will analyze for cliques. 
When a node tries to read from the memory, the window is locked (so other other reading/writing occurs). The node reads the counter using MPI_Get, finds the cliques in the given subset, increases the count, 
and writes back using MPI_Put. All machines repeat this until they have reached the last task. This is pulled atomically using *MPI_Win* which returns a window object that grants the process shared memory to perform its task. The resulting subgraph that is created consists of that
pointer and all of its neighbors so that it can compute the deep cliques. * MPI_All_Reduce* is used after all nodes have finished all tasks to get the total # of cliques at end.  
We used a base code from the works of Danisch, Balalau & Sozio (2018) to implement the aforementioned MPI methods to administer this shared memory method.


## Optimizations
1. Dynamic Scheduling  
- Allows for simplification to handle unknown dependencies; more tasks are created than number of machine there are.
2. Truss and runtime degree based approaches to filter the search space.  
- Allows for better efficiency
3. Cyclic vertex partitioning   
- Better load balancing
4. Hybrid Shared-memory + Distributed-memory parallelism  
- Reduces memory overhead and increases speed of output


## Compiling & Execution


### DDegColNodeParallel-2.c
This program expands upon the code implementation done by Danisch, Balalau & Sozio detailed in "Listing k-cliques in Sparse Real-World Graphs." It prints the total number of k-cliques.


#### To Compile:



#### To Execute:










## Future Work
Currently, we target small graphs and deep cliques. Hence, the graph is replicated on all nodes and is distributed.
In the future, we want to partition the graph so that is not replicated on all nodes and use work stealing for load balancing. 


