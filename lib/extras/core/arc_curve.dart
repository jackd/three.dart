part of three;

class ArcCurve extends Curve<Vector2> {

  num aX, aY, aRadius, aStartAngle, aEndAngle;
  bool aClockwise;

  ArcCurve(this.aX, this.aY, this.aRadius, this.aStartAngle, this.aEndAngle, this.aClockwise) : super();

  Vector2 getPoint(t) {

    var deltaAngle = aEndAngle - aStartAngle;

    if (!aClockwise) {
      t = 1 - t;
    }

    var angle = aStartAngle + t * deltaAngle;

    var tx = aX + aRadius * Math.cos(angle);
    var ty = aY + aRadius * Math.sin(angle);

    return new Vector2(tx, ty);
  }

}
