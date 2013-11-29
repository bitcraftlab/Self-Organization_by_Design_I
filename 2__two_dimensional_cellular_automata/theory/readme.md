
2D Cellular Automata
====================

## Neighbors on the 2D square-grid

Due to our cultural bias, the `rectilinear` or `square grid` is the most popular among the 2D grids. The two other regular grids in the plane are the hexagonal and its dual, the triangular grid.

Let's first have a look at neighborhoods on the square grid. Once we have covered those, we can move on to more interesting neighborhoods.

### Neumann Neighborhood

The Neumann Neighborhood has 4 Neighbors in North, East, West and South direction.
It contains every cell with a taxicab distance or *minimum-norm* of `1`.

A *norm* is a mathematical function for calculating the distances between two points. The most popular norm in continuous space is the euclidian norm, but since
we are in discrete space we have to watch out for alternatives.

This is the formula for Von Neumann Neighborhoods of order `r`:

	min_norm(x1, y1, x2, y2) = min(dx, dy) < r

width dx = abs(x2-x1) and dy = abs(y2-y1) (distance along the x- and y-axis)

###### Question

- How many cells are in a Neumann Neigborhood of order 3?


### Moore Neighborhood

If you add neighbors in diagonal directions, you get the Moore
Neighborhood (8 Neighbors).
It contains every cell with a maximum-norm of 1.
The respective forumla for Moore-Neighborhoods of order `r` is:

	max_norm(x1, y1, x2, y2) = max(dx, dy) < r

###### Question
- How many cells are in a more-neighborhood of `r = 5`?


### Euclidian Neigborhood

For larger neighborhoods, you can also approximate circular neighborhoods,
based on the euclidian norm:

	euclid_norm(x1, y1, x2, y2) = sqrt(dx*dx, dy*sy) < r
	
###### Questions

- How many cells are in a euclidian neighborhood of `r = 5`?
- How many possible input states are there?
- How many different Cellular Automata?

### Unconventional Neighborhoods

Neighborhoods come in all shapes and sizes.
The Moore, Von Neumann and the Euclidian Neighborhood just happen to be the most popular ones.  Since we have used functions to define neighborhoods, we can now use arbitrary functions to define our own neighborhoods.

###### Questions

- Look up the mathematical definition of a *norm*
- Can you think of other neighborhood functions that are norms?  
  Can you think of neighborhood functions that aren't?
- How does the 'normality' of a function, affect the connectedness
  of the cell neighborhood?
  
Have a look at the two functions below:  

  *Disjunctive Neighborhood*

	  or_neighbors(x1, y1, x2, y2) = bitwise_or(dx, dy) < r

  *Conjunctive Neighborhood*
		
	  and_neighbors(x1, y2, x2, y2) = bitwise_and(dx, dy) < r
	  
- Do those functions constitute a norm? 
- What is the resulting neighborhood shape? 


## 2D-Topology

We already covered the basics of topology for the 1D case.
The 2D case allows for much more interesting topologies [^5]

|  Topology          |  Notation   |
|--------------------|-------------|
|  Patch             |  `( 0, 0)`  |
|  Cylinder          |  `( 1, 0)`  |
|  Torus (Donut)     |  `( 1, 1)`  |
|  Moebius Strip     |  `(-1, 0)`  |
|  Klein Bottle      |  `(-1, 1)`  |
|  Projective Plane  |  `(-1, -1)` |


The numbers in braces, show how the horizontal and vertical
edges are connected:
    
0 → not connected  
1 → connected  
2 → connected with a half-flip

Among those topologies the Patch is usually most suitable for real-world simulation. Otherwise you might want to go with the Torus (wrap-around in both x and y direction) so you don't have to consider the border cases.

## Symmetry

So far we have looked at the most simple computational systems.  
But as we have seen the size of the rule table and the complexity of the system increases drastically when we increase the neighborhood-size.

One way to reduce this complexity, is by limiting our selves to CAs that exhibit certain kinds of symmetry.

### Space Symmetry

In most physical simulations there is no preferred direction of space, making symmetric Cellular Automata a valid choice. Below is a rule table for a [3,2] 1D-Automaton, that treats symmetric pairs of input identically:

| Neighborhoods               | Next State |
|-----------------------------|------------|
|  (0,**0**,0)                |            |
|  (1,**0**,0) (0,**0**,1)    |            |
|  (0,**1**,0)                |            |
|  (0,**1**,1) (1,**1**,0)    |            |
|  (1,**0**,1)                |            |
|  (1,**1**,1)                |            |

Note the pairs of symmetric input sequences  (2nd and 4th row)
and self-symmetric/palindromic input sequences (remaining rows)

###### Questions

- What kinds of symmetry, and anti-symmetry (!) can you have on a 1D grid?
- Identify CAs that create symmetric patterns
- How many mirror symmetries can you spot in the Neumann Neighborhood?
- How many rotation symmetries can you spot in the Moore Neighborhood?

### Anti-Symmetry

By treating inputs (1,**0**,0) and (0,**0**,1) the same, we achieve 1D-mirror symmetry.  But there is also *anti-symmetry*:  
The sequences (1,0,0) and (0,1,1) are anti-symmetric, because their states are reflected (0 → 1 and 1 → 0).


In anti-symmetric rules neither state receives a special treatment.
For those kinds of rules it is sufficient to provide the first half
of the rule table:

| Neighborhoods | Next State |
|---------------|------------|
|  (0,**0**,0)  |     1      |
|  (0,**0**,1)  |     0      |
|  (0,**1**,0)  |     0      |
|  (0,**1**,1)  |     1      |

The second half is obtained by inverting 0s and 1s.

### Totalistic Cellular Automata

The rule table of a cellular automaton can often be radically simplified, if we only care about a certain property of the neighborhood. (For example the total sum of the neighbors) If we just sum up the number of ones, in the elementary [3, 2] CA there are just three rules:

| Neighborhoods                              |    Total   | Next State |
|--------------------------------------------|------------|------------|
|  (0,**0**,0)                               |     0      |            |
|  (0,**0**,1) (0,**1**,0) (1,**0**,0)       |     1      |            |
|  (0,**1**,1) (1,**0**,1) (1,**1**,0)       |     2      |            |
|  (1, **1**, 1)                             |     3      |            |


The total can be everyhing between zero, if the complete neighborhood is all `0`,
or `n` if the neighborhood is all `1`.  
This results in a set of 4 rules (`n + 1` in the general case).  
As a result there are `2^4 = 16` totalistic Elementary Automata.

###### Questions

- What is the relation between this totalistic CA and the symmetric CA?


### Outer-Totalistic Cellular Automata

If the cell's own state is treated independetly from its neighbors,
we get what is known as outer-totalistic CA.  A very popular example of this is Conway's Game of Life (GOL)
In GOL the next state of a cell is determined by its own state and the number of cells which are alive in its neighborhood.


##### Questions

- Can you draw the rule table for the Game of Life?


## Classification

Once you have created a system and found parameters you can vary to control its outcome, you can create a whole range of creatures.  
The classification of this Bestiarium is very similar to what a Biologist or Anthropologist would do, when exploring a new continent. On his journey, Wolfram has identified 4 different classes of Cellular Automata,
based on their behaviour[^10].

##### Questions

- Can you think of methods to identify interesting CAs automatically?


## Links

###### Neighborhoods

- [Mathematical Norms](http://en.wikipedia.org/wiki/Norm_%28mathematics%29) (wikipedia)
- [Moore Neighborhood](http://en.wikipedia.org/wiki/Moore_neighborhood) (wikipedia)
- [Von Neumann Neighborhood](http://en.wikipedia.org/wiki/Von_Neumann_neighborhood) (wikipedia)

###### Symmetry

- [Totalistic CA](http://mathworld.wolfram.com/TotalisticCellularAutomaton.html) (mathworld)
- [Outer-Totalistic CA](http://mathworld.wolfram.com/Outer-TotalisticCellularAutomaton.html) (mathworld)
- [Totalistic Cellular Automata](http://atlas.wolfram.com/TOC/TOC_300.html) (wolfram atlas of simple programs) 

###### Classification

- [Wolfram's Classification of CA](http://en.wikipedia.org/wiki/Cellular_automaton#Classification) (wikipedia)

###### Topology

- [Overview of 2D Topologies](http://puzzlezapper.com/blog/2013/05/a-polyformists-toolkit-practical-topology/) (puzzlezapper)
- [Moebius Strip](http://en.wikipedia.org/wiki/Moebius_Strip) (wikipedia)
- [Klein Bottle](http://en.wikipedia.org/wiki/Klein_Bottle) (wikipedia)
- [Projective Plane](http://en.wikipedia.org/wiki/Real_projective_plane) (wikipedia)
