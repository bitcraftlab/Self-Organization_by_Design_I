
abstract class TextureLandscape extends Landscape {
  
  PImage tex;
  
  TextureLandscape(float[][] array) {
    super(array);
    tex =  createTexture(textureIndex, values * tscale, values * tscale);
  }

  void setStyle() {
    shp.texture(tex);
    super.setStyle();
  }
  
  void update(PImage texture) {
    tex = texture;
    shp.setTexture(tex);
  }
  
  // add texture coordinates to newly created vertices
  void createVertex(int x, int y) {
    shp.vertex(x, y, a[x][y],  x * tscale , y * tscale);
  }
  
}
