
/////////////////////////////////////////////
//                                         //
//        Boid Surface Excercise           //
//                                         //
/////////////////////////////////////////////

// The code for this exercise was adapted from the 
// a lgebraic surface example by Giovanni Carlo Mingati 
// http://www.openprocessing.org/sketch/59700

// This sketch creates an iso-surface from an array of values
// Task: Create a boid-system to create values, which can then
// be turned into a 3D Shape

import wblut.math.*;
import wblut.processing.*;
import wblut.core.*;
import wblut.*;
import wblut.hemesh.*;
import wblut.geom.*;

import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;


PeasyCam cam;
HEC_IsoSurface creator;
HE_Mesh mesh;
WB_Render render;

int vals = 30;
int res = vals-1;


float isoLevel = 0.5;
float isoDelta = isoLevel * 0.1;

void setup() {
  
  size(600, 400, P3D);
  cam = new PeasyCam(this, 1200);
  
  // Fill the 3D array with continuous values  
  
  float[][][] values = drawValues(vals); 
  
  // Use a HE_Mesh surface creator, to create an Iso-Surface from the values
  
  creator=new HEC_IsoSurface();
  creator.setResolution(res, res, res); // number of cells in x,y,z direction
  creator.setSize(25, 25, 25);          // cell size
  creator.setValues(values);            // values corresponding to the grid points
  creator.setIsolevel(isoLevel);        // isolevel to mesh
  creator.setInvert(true);              // invert mesh
  creator.setBoundary(100);             // value of isoFunction outside grid
  
  mesh=new HE_Mesh(creator);
  render=new WB_Render(this);
}

void draw() {
  
  // render the scene using the WBlut renderer
  
  background(220);
  lights();
  directionalLight(127, 127, 127, 1, 1, -1);
  directionalLight(127, 127, 127, -1, -1, 1);
  noStroke();
  fill(225);
  rotateY(radians(-25));
  render.drawFaces(mesh);
}

void keyPressed() {
  
  // use the keyboard to change the critical isolvel
  // used for rendering the iso-surface

  switch(key) {
	  case '+': isoLevel += isoDelta; break;
	  case '-': isoLevel -= isoDelta; break;
  }
  creator.setIsolevel(isoLevel);
  mesh=new HE_Mesh(creator);
}
