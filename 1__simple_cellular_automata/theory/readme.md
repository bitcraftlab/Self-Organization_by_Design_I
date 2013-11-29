Simple Cellular Automata
========================

Cellular Automata give rise to great complexity from very simple rules.  
There are some really tiny Processing implementations (as small as 200 chars).

## Cell States

Cell states are usually binary (boolean values), discrete (integers) or continuos (real numbers). In more esoteric Cellular Automata cells even contain vectors or other mathematical structures.

## Neighborhood

The neighborhood refers to the number and position of cells that determine the next state of a cell.

## Ruleset

The Ruleset provides a transition rule for every combinations of states in the neighborhood. This number of rules increases very fast for large numbers of neighbors or cell states.

## Elementary CA Notations

###### Wolfram Notation

`(n, k)`  

`n` = *( number of neighbors - 1 ) / 2*  
`k` = *number of states*


###### Better Notation

 `[n, s]`  

`n` = *number of neighbors*  
`s` = *number of states*

## Simplifying Cellular Automata

### Wolfram's Elementary CA

The most well known CA.  
Discovered by Wolfram in 1980s

    [3, 2] Automaton ==> 3 Neighbors, 2 States

###### Rule Table

Here's the rule table for a CA known as Rule 110.

| Neighborhood  | Next State |
|---------------|------------|
| (0, **0**, 0) |     0      |
| (0, **0**, 1) |     1      |
| (0, **1**, 0) |     1      |
| (0, **1**, 1) |     1      |
| (1, **0**, 0) |     0      |
| (1, **0**, 1) |     1      |
| (1, **1**, 0) |     1      |
| (1, **1**, 1) |     0      |


###### Enumerating Rules and CAs

There are `2^3 = 8` possible neighborhood states (`k^n`)  
For each state we need a single rule, so there are `2^8` possible combinations of rules, or rule sets. 

So there are `2^(2^3) = 256` possible rules.  
(In the general case: `|rules| = k^k^n`)


### The Most-Elementary CA

This Automaton is not well known, even though it is the
most elementary CA one could imagine.
(Unless you consider *really* trivial ones like [1, s] or [1, n] Automata)  

    [2, 2] Automaton  ==> (2 neighbors, 2 states) 
 
Super-Elementary CA are limited to Class 1 - Class 3 behaviour.
They are best displayed on a hexagonal, or brick lattice,
for the sake of symmetry.

###### Rule Table

| Neighborhood  | Next State |
|---------------|------------|
|  (**0**, 0)   |     0      |
|  (**0**, 1)   |     1      |
|  (**1**, 0)   |     1      |
|  (**1**, 1)   |     1      |

###### Enumerating Rules and CAs

The rule table has only `2^2 = 4` rules.  
There are `2^2^2 = 16` possible automata. 

## 1D-Topology

So far we have assumed that every cell at least 2 inputs - this works fine as long as we have an infinite number of cells. But that's kind of impractical given the finite resources of your computer.

If we imagine the cells as a chain there will always be the ends of the chain, that need special treatment. In the 1D case there are basically two possibilities:

- Circular Topology (Wrap-Around)
- Linear Topology (Special Border Conditions)

## Links

###### Elementary CA
- [Elementary Cellular Automata](http://en.wikipedia.org/wiki/Elementary_cellular_automaton) (wikipedia)
- [Elementary Cellular Automata](http://atlas.wolfram.com/01/01/) (wolfram atlas of simple programs)

###### Programming
- [Nature of Code](http://natureofcode.com/book/chapter-7-cellular-automata/) (dan shiffman)

