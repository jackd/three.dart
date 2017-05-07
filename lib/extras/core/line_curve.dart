part of three;

class LineCurve<V extends Vector<V>> extends Curve<V> {
  V v1, v2;

  V getPoint(t) => v2.clone()
    ..sub(v1)
    ..scale(t)
    ..add(v1);

  LineCurve(this.v1, this.v2) : super();

  // Line curve is linear, so we can overwrite default getPointAt
  V getPointAt(u) => getPoint(u);

  V getTangent(t);
}
