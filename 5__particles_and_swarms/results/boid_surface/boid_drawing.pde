
// create a function here that uses boids to create a 3D-cube of values

float[][][] drawValues(int vals) {

  float[][][] values = new float[vals][vals][vals];


  PGraphics img = createGraphics(vals, vals, P2D);
  Flock flock = new Flock(img, boids, vals, vals);
  
  for (int z = 0; z < vals; z++) {

    img.beginDraw();
    img.background(0);
    img.fill(255);

    flock.run();

    img.endDraw();
    img.loadPixels();

    for (int i = 0; i < img.pixels.length; i++) {
      int x = i % vals;
      int y = i / vals;
      values[x][y][z] = map(brightness(img.pixels[i]), 0, 255, 0, 1);
    }
  }

  return values;
}
