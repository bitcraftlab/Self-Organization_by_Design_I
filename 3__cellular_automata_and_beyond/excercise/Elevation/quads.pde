
class QuadLandscape extends TextureLandscape {
  
  QuadLandscape(float[][] array) {
    
    super(array);  

    shp = createShape();
    shp.beginShape(QUADS);
    setStyle();
    setVertices();
    shp.endShape();
       
  }
  
  void setVertices() {
    
     for(int x = 0; x < values - 1; x++) {
      for(int y = 0; y < values - 1; y++) {
        
        // four corners of the quad
        setVertex(x, y);
        setVertex(x + 1, y);
        setVertex(x + 1, y + 1);
        setVertex(x, y + 1);
        
      }
    }
    
  }
  
}
