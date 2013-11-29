	

## Cellular Automata and Beyond

There are various directions for extending basic CAs, some of which are pretty much uncharted territory.


|Aspect          | Generalization                           |
|----------------|------------------------------------------|
| Dimension      | 2D, 3D, Higher Dimensional CA            |
| State          | Continuous States, Vectors, Sets …       |
| Grids          | Hexagonal, Triangular, Irregular         |
| Space          | Continuous, Dynamic, Fractal             |
| Parallelism    | Continuous, Margolus, Asynchronous       |
| Neighborhoods  | Multilayer, Multilevel, Network-Automata |


In this session we will explore some of those, namely:

- Automata on various grids
- Block Automata
- Asynchronous Automata
- Continuous CA
- Vector CA

## Beyond Parallelism

### Lattice Gas Automata

Cellular Automa can be used to simulate physical systems:

**Simple Physics** → conservation of mass (number of pixels)  
**Complex Physics** → conservation of impulse + energy

In the model of Tiffoli and Margolus, the units of computation are not the rectangles delimited by the  grid, but the connections of the
grid itself. An edge can point in either direction representing the impulse of a particle.

- The **HPP** Model named after its authors **H**ardy, **P**omeau and de **P**azzis) is based on the square grid.  
- The **FHP** Model is an improved version based on the hexagonal grid.  
It solves the Navier-Stokes-equation used to describe fluids.

###### Question
- How can we map a lattice automaton to a cellular automaton?

### Block Automata

In the implementation developed by Tiffoli and Margolus,
we update blocks of cells, rather than individual cells.
The size of each block is also refered to as the *Margolus Neighborhood*.

###### Examples  

- billiard ball physics 
- falling sand simulations 
- lattice gas automata

### Async Automata
If we want to simulate the physics of particles or moelcules we can also update their position, one at a time. Depending on the implementation those automata are basically swarm-systems that happen to live in a discrete world.

###### Examples
- Cluster-Cluster Aggregation (A Variant of Diffusion Limited Growth)
- Flock of Blocks (Physical Simulation inspired by TETRIS)
- Falling Sand Simulations


## Continuous CA

What changes if we stay in the discrete space, but allow for continuous states?  
Every cell can now have any of an infinte number of values, rather than just 0 and 1. Most notably our rule tables which are really discrete functions, turn into continuous functions.

As a result it is not possible any more to spell out the rule table.
(There is an infinite number of possible states, and therefor rules) Instead we are going to use functions! Let's keep it simple and look at a 1D automaton:

    val(x, t) = f(val(x-1, t-1), val(x, t-1))

In plain English:  
Every cell is assigned a value based on the values of its
neighbors at the previous time-step. The formula above is for two neighbors (including the cell itself) It is the continuous version of the most-elementary CA,
we already got to know.

###### Questions

- If you think of physical systems, what could the continuos value represent?
- Are digital computers, capable of continuous simulations at all?
- How can you make sure that continuous values stay within a certain range?


## Vector CA

Rather than just assigning a single continuous value to each cell, we can use a whole bunch of them. In physical terms the components of the vector might represent:

- seperate chemicals that interact (activator, inhibitor, ...)
- difference or integration over time ( think: rate of change, acceleration, ... )

In physics such systems are usually described by Partial Differential Equations (PDEs). Solving those is really nasty. But we can simulate such systems by doing simple arithmetic operations at the cell level ( like adding and subtracting values )

### Reaction-Diffusion Systems

Reaction Diffusion systems, are systems with serveral chemicals (think vector components) with different diffusion rates (think neighborhood size).
The amount of each chemical, and its rate of change (think even more vector components) controls the amount of the other chemicals, or their rate of change (more vector components!)

The implementation of a RD-System may separate Reaction and Diffusion into seperate steps. In the diffusion step each cell spills a bit of its contents over to its neighbors.

#### Diffusion

If we use a Neumann Neighborhood, this can be represented by the formula:

     a(x,y) = { a(x-1,y) + a(x, y-1) + a(x+1,y) + a(x, y+1) } / 4
     
This operation corresponds to a smoothing filter in image processing. Therefor we may also use highly efficient algorithms like box-blur for maximum effect.

### Neural-Network Automata

If you stack several cellular automata on top of each other where each cell is connected to cells in the neighborhood of the adjacent layers you get a Neural Network. 

You can use the flow (differences of concentrations over time and space) to change the neighborhood dynamically, resulting in flowing patters.

## Links

### Beyond Parallelism

- [Block Cellular Automaton](http://en.wikipedia.org/wiki/Block_cellular_automaton) (wikipedia)
- [Lattice Gas Automata](http://en.wikipedia.org/wiki/Lattice_gas_automaton) (wikipedia)

### Continuous Cellular Automata

* [Reaction Diffusion](http://en.wikipedia.org/wiki/Reaction%E2%80%93diffusion_system) (wikipedia)
* [Reaction Diffusion - Gray Scott Model](http://mrob.com/pub/comp/xmorphia/) (Robert Munafo)

### Vector Automata

- [Cyclic Symmetric Multi-Scale Turing Patterns](http://www.jonathanmccabe.com/Cyclic_Symmetric_Multi-Scale_Turing_Patterns.pdf) (Jonathan McCabe)
- [Neurovision Sandbox](http://perceptify.com/neurovision/) (Martin Schneider)





