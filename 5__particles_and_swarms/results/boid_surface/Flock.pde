// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Flock class
// Does very little, simply manages the ArrayList of all the boids

class Flock {

  ArrayList<Boid> boids; // An ArrayList for all the boids

  Flock(PGraphics g, int size, int w, int h) {
    
    boids = new ArrayList<Boid>(); // Initialize the ArrayList
      
    for (int i = 0; i < size; i++) {
      Boid b = new Boid(g, w/2, h/2);
      addBoid(b);
    }
  
  }

  void run() {
    for (Boid b : boids) {
      b.run(boids);  // Passing the entire list of boids to each boid individually
    }
  }

  void addBoid(Boid b) {
    boids.add(b);
  }

}
