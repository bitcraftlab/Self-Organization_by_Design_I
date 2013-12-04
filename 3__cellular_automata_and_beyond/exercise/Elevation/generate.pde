

float[][] noise2D() {
   float[][] a = new float[values][values];
   for(int x = 0; x < values; x++) {
     for(int y = 0; y < values; y++) {
        a[x][y] = 20 * noise(updateIndex * 0.05, x * 0.05, y * 0.05);
     }
   }
   return a;
}


PImage createTexture(int idx, int w, int h ) {

  PGraphics tex = createGraphics(w, h, P3D);
  
   // we need to call noSmooth before beginDraw, to prevent anti-aliasing
  tex.noSmooth();
  tex.beginDraw();
  
  tex.background(255);
  tex.noFill();
     
  switch(idx % 2) {
    
    case 0: // table cloth pattern
      tex.stroke(0, 20);
      for(int x=0; x< tex.width; x+=2) {
        tex.line(x,0,x, tex.height); 
      }
      for(int y=0; y< tex.height; y+=2) {
        tex.line(0, y, tex.width, y); 
      }
      break;
      
    case 1: // concentric circles
      tex.stroke(230);
      tex.strokeWeight(tscale / 4);
      for(int x = tex.width/tscale; x > 0; x--) {
        tex.ellipse(tex.width/2, tex.height/2, x * tscale, x * tscale); 
      }
      break;
      
  }
    
  tex.endDraw();
  
  // we need to return tex.get() to prevent anti-aliasing !
  // SEE: http://forum.processing.org/one/topic/p3d-disable-texture-smoothing-antialiasing-when-upscaling.html
  return tex.get();
   
}


// update the shape whenever the render settings have changed
void createLandscape() {
  float[][] a = noise2D();
  landscape = triangleMode ? new TriangleLandscape(a) : new QuadLandscape(a);
}

// only update the vertices if the landscape has changed
void updateLandscape() {
  updateIndex++;
  float[][] a = noise2D();
  landscape.update(a);
}

// only update the texture
void updateTexture() {
  PImage tex = createTexture(++textureIndex, values * tscale, values * tscale);
  landscape.update(tex);
}
