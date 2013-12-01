
class TriangleLandscape extends TextureLandscape {
  
  TriangleLandscape(float[][] array) {
    
    super(array);
    
    shp = createShape();
    shp.beginShape(TRIANGLES);
    setStyle();
    setVertices();
    shp.endShape();
    
  }
  
  void setVertices() {
   
    // split every quad into two triangles
    for(int x = 0; x < values - 1; x++) {
      for(int y = 0; y < values - 1; y++) {
        
        // first triangle
        setVertex(x + 1, y); 
        setVertex(x, y);  
        setVertex(x + 1, y + 1);
        
         // second triangle
        setVertex(x + 1, y + 1); 
        setVertex(x, y + 1); 
        setVertex(x, y);
        
      }
    } 
  }
  
}
