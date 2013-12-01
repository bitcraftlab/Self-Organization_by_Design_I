
///////////////////////////////////////////
//                                       //
//          E L E V A T I O N            //
//                                       //
///////////////////////////////////////////

// (c) Martin Schneider @bitcraftlab 2013

// Mesh Example for Processing 2.0

// This sketch shows how to create a landscape with custom elevation and textures and
// using Processing's createShape and Shape.setVertex functions for smooth 
// realtime 3D Graphics


// display
boolean showGrid = true;
boolean softMode = true;
boolean triangleMode = false;
int tscale = 8;

// camerea
import peasy.*;
PeasyCam cam;

int updateIndex;
int textureIndex;

float zoom;
int w;

TextureLandscape landscape;
PFont f;

int values = 100;

void setup() {
  
  size(800, 600, P3D);  
  cam = new PeasyCam(this, width);
  cam.rotateX(-0.8);
  
  ((PGraphicsOpenGL)g).textureSampling(3);
  hint(DISABLE_TEXTURE_MIPMAPS);
  noSmooth();
  
  w = values - 1;
  zoom  = width / w;
  createLandscape();
  
}

void draw() {

  if(showGrid) {
    stroke(0);
  } else {
    noStroke(); 
  }
  
  // make sure the lights are positioned relative to the camera
  cam.beginHUD(); 
  lights(); 
  ambientLight(50, 0, 0); // add a touch of red :-)
  cam.endHUD();
  
  background(255);

  // landscape draw with antialiasing
  smooth(4);
  scale(zoom);
  translate(-w/2, -w/2);
  
  landscape.draw();
  
}


void keyPressed() {
  switch(key) {
    case 'g':
      showGrid = ! showGrid;
      createLandscape();
      break;
    case 'f':
      triangleMode = !triangleMode;
      createLandscape();
      break;
    case 's':
      softMode = !softMode;
      createLandscape();
      break;    
    case 't':
      updateTexture();
      break;
    case ' ':
      updateLandscape();
      break;

  } 
}
