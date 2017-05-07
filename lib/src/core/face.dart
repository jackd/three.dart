part of three;

/// Base class for all Face types.
abstract class Face {
  List<int> indices;
  Vector3 normal;
  List<Vector3> vertexNormals;
  Color color;
  List<Vector3> vertexColors;
  List<Vector4> vertexTangents;
  int materialIndex;
  Vector3 centroid;

  /// normalOrVertexNormals and colorOrVertexColors can be either a [Vector3] or a [List<Vector3>]
  Face(this.indices, normalOrVertexNormals, colorOrVertexColors,
      this.materialIndex) {
    if (normalOrVertexNormals == null) {
      normal = new Vector3.zero();
      vertexNormals = [];
    } else if (normalOrVertexNormals is Vector3) {
      // assert(normalOrVertexNormals.every((n) => n is Vector3));
      normal = normalOrVertexNormals;
      vertexNormals = [];
    } else {
      assert(normalOrVertexNormals is List &&
          normalOrVertexNormals.every((n) => n is Vector3));
      normal = new Vector3.zero();
      vertexNormals = normalOrVertexNormals;
    }

    // normal = normalOrVertexNormals is Vector3 ? normalOrVertexNormals : new Vector3.zero();
    // vertexNormals = normalOrVertexNormals is List ? normalOrVertexNormals : [];
    // if (colorOrVertexColors is Color) {
    //   // assert(colorOrVertexColors.every((n) => n is Color));
    //   color = colorOrVertexColors;
    //   vertexColors = [];
    // } else {
    //   assert(colorOrVertexColors is List);
    //   color = new Color();
    //   vertexColors = colorOrVertexColors;
    // }
    color = colorOrVertexColors is Color ? colorOrVertexColors : new Color();
    vertexColors = colorOrVertexColors is List ? colorOrVertexColors : [];

    vertexTangents = [];
    centroid = new Vector3.zero();
  }

  Face.single(this.indices, this.normal, this.color, this.materialIndex) {
    vertexNormals = [];
    vertexColors = [];

    vertexTangents = [];
    centroid = new Vector3.zero();
  }

  Face.multiple(
      this.indices, this.vertexNormals, this.vertexColors, this.materialIndex) {
    normal = new Vector3.zero();
    color = new Color();

    vertexTangents = [];
    centroid = new Vector3.zero();
  }

  int get size => indices.length;

  /// Copies all the values from `other` into this Face.
  Face setFrom(Face other) {
    normal.setFrom(other.normal);
    color.copy(other.color);
    centroid.setFrom(other.centroid);

    materialIndex = other.materialIndex;

    vertexNormals = other.vertexNormals.map((Vector3 v) => v.clone()).toList();
    vertexColors = other.vertexColors.map((Vector3 v) => v.clone()).toList();
    vertexTangents = other.vertexTangents.map((v) => v.clone()).toList();

    return this;
  }

  /// Vertex A index.
  int get a => indices[0];

  /// Set vertex A index.
  set a(int i) {
    indices[0] = i;
  }

  /// Vertex B index.
  int get b => indices[1];

  /// Set vertex B index.
  set b(int i) {
    indices[1] = i;
  }

  /// Vertex C index.
  int get c => indices[2];

  /// Set vertex C index.
  set c(int i) {
    indices[2] = i;
  }

  Face clone();
}
