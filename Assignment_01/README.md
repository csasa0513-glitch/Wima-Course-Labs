# Assignment 1: Linear Optimization

## Task 1: Exhaustive Search
Implementation of the enumeration algorithm to find all basic feasible solutions of a polyhedron $\{x \in \mathbb{R}^n | Ax = b, x \geq 0\}$.

### Example Result 
- **Optimal x**: `[6.8571, 8.0000, 13.7143, 0, 0]`
- **Optimal z**: `388.5714`

## Task 2: Runtime Analysis
Experimental evaluation of the computational complexity as the problem size $m$ increases from 2 to 10. The results demonstrate the exponential growth of combinations in the exhaustive search method.
