
abstract class Landscape {
  
  PShape shp;
  float[][] a;
  boolean updateMode;
  int vIndex;
 
  Landscape(float[][] array) {
    a = array;
  }
  
  
  void draw() {
    shape(shp);
  }
  
  
  void update(float[][] array) {
    a = array;
    updateMode = true;
    vIndex = 0;
    setVertices();
  }
  
  
  // set vertices according to the array
  abstract void setVertices();
  
  
  void setStyle() {     
    // shp.fill(#ccccff);
    if(showGrid) {
      shp.stroke(0, softMode ? 50 : 20);
      shp.strokeWeight(softMode ? 1.0 : 0.5);
    } else {
      shp.noStroke(); 
    }
  }
  
  //////// Helper Functions /////////
    
  void setVertex(int x, int y) {
    
     if(updateMode) {    
       
       // update vertex
       shp.setVertex(vIndex, x, y, a[x][y]);
       if(softMode) {
          PVector n = vertNormal(x, y);
          shp.setNormal(vIndex, n.x, n.y, n.z);
       }
       vIndex++;
       
     } else {
               
       // create vertex 
       if(softMode) { 
         PVector n = vertNormal(x, y);  
         shp.normal(n.x, n.y, n.z); 
       }
       createVertex(x, y);
       
     }
     
  }
  
  // custom function for vertex creation, so subclasses can modify it
  void createVertex(int x, int y) {
    shp.vertex(x, y, a[x][y]);
  }

  PVector faceNormal(int x, int y) {
    int x2 = min(x + 1, a.length-1);
    int y2 = min(y + 1, a[0].length-1);
    PVector u = new PVector(1, 0, a[x2][y] - a[x][y]);
    PVector v = new PVector(0, 1, a[x][y2] - a[x][y]);
    PVector n = v.cross(u);
    n.normalize();
    return n;
  }
  
  PVector vertNormal(int x, int y) {
    int x1 = max(x - 1, 0);
    int y1 = max(y - 1, 0);
    int x2 = min(x, a.length-1);
    int y2 = min(y, a[0].length-1);
    PVector n = new PVector();
    n.add(faceNormal(x1, y1));
    n.add(faceNormal(x2, y1));
    n.add(faceNormal(x1, y2));
    n.add(faceNormal(x2, y2));
    n.normalize();
    return n;
  }
  
}
