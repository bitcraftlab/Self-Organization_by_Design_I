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
  

  PVector pos = new PVector();
  
  
  float[][][] values = drawValues(vals); 


  creator=new HEC_IsoSurface();
  creator.setResolution(res, res, res);// number of cells in x,y,z direction
  creator.setSize(25, 25, 25);// cell size
  creator.setValues(values);// values corresponding to the grid points
  creator.setIsolevel(isoLevel);// isolevel to mesh
  creator.setInvert(true);// invert mesh
  creator.setBoundary(100);// value of isoFunction outside grid
  
  mesh=new HE_Mesh(creator);
  render=new WB_Render(this);
}

void draw() {
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
  switch(key) {
  case '+': 
    isoLevel += isoDelta;
    break;
  case '-': 
    isoLevel -= isoDelta;
    break;
  }
  creator.setIsolevel(isoLevel);
  mesh=new HE_Mesh(creator);
}
