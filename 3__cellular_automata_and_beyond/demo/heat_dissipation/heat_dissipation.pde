
 /////////////////////////////////////
 //                                 //
 //      H E A T - Dissipation      //
 //                                 //
 /////////////////////////////////////

 // (c) Martin Schneider 2013

 // A very simple dissipation simulation.
 // Use the mouse to draw cold traces, and watch the energy dissipate.
 // If any key is pressed the heatmap function provides a constant influx of energy,
 // slowly resetting the image to its inital state.

float[][] gradient;

void setup() {
  size(300, 300);
  colorMode(HSB);
  initGradient();
}


void draw() {
  updateGradient();
  renderGradient();
}


void initGradient() {
 
  gradient = new float[width][height];
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      gradient[y][x] = heatMap(x, y);
    }
  }
  
}


// gradient from top to bottom
float heatMap(float x, float y) {
  return map(y, 0, height, 1.0, 0.33);
}


void updateGradient() {

  float heat = keyPressed ? 0.05: 0;

  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {

      // wrap x coords
      int x1 = (x + width - 1) % width;
      int x2 = (x + 1) % width;

      // dont't wrap y coords
      int y1 = max(y - 1, 0);
      int y2 = min(y + 1, height - 1);

      // update gradient from the 4 neighbor cells
      gradient[y][x] = (gradient[y1][x] + gradient[y2][x] + gradient[y][x1] + gradient[y][x2]) / 4;

      // influx from the heatmap
      gradient[y][x] = lerp(gradient[y][x], heatMap(x, y), heat);
      
    }
  }
}


void renderGradient() {

  loadPixels();

  for (int i = 0, n = pixels.length; i < n; i++) {

    // get x and y coordinates
    int y = i / width;
    int x = i % width;

    // map gradient to colour
    float d = 255 * gradient[y][x];
    int rainbow = (int(255 - d) / 10) * 10;
    pixels[i] = color(rainbow, d, 255);
    
  }

  updatePixels();
  
}


// circular stamp in the gradient field
void stamp(int px, int py, int r) {

  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      // set gradient to zero inside the circle
      if (dist(x, y, px, py) < r) {
        gradient[y][x] = 0;
      }
    }
  }
}

void mouseDragged() {
  stamp(mouseX, mouseY, 10);
}

void mousePressed() {
  stamp(mouseX, mouseY, 15);
}
