part of three;

/// Triangle face.
class Face3 extends Face {
  Face3(
      [int a = 0,
      int b = 0,
      int c = 0,
      normalOrVertexNormals,
      colorOrVertexColors,
      int materialIndex])
      : super([a, b, c], normalOrVertexNormals, colorOrVertexColors,
            materialIndex);

  /// Make a copy of this Face3.
  clone() => new Face3(a, b, c).setFrom(this);
}
