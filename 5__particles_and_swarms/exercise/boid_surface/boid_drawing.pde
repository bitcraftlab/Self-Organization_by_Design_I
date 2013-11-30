
// create a function here that uses boids to create a 3D-cube of values

float[][][] drawValues(int vals) {

  float[][][] values = new float[vals][vals][vals];

  for (int z = 0; z < vals; z++) {
    for (int y = 0; y < vals; y++) {
      for (int x = 0; x < vals; x++) {
        float d = dist(x, y, vals/2.0, vals/2.0);
        values[z][y][x] = map(d , 0,  vals/2,  0.0, 1.0);
      }
    }
  }
  
  return values;
  
}
