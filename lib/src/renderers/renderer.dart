part of three;

abstract class Renderer<C extends Camera> {
  Element get domElement;
  void render(Scene scene, C camera);
  void setSize(num width, num height);
}
