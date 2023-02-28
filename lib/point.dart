import 'dart:math';

class Point {
  final double x;
  final double y;
  final double z;

  Point(this.x, this.y, this.z);

  factory Point.zero() {
    return Point(0, 0, 0);
  }

  factory Point.vector() {
    return Point(1, 1, 1);
  }

  double distanceTo(Point other) {
    return sqrt(
        pow((x - other.x), 2) + pow((y - other.y), 2) + pow((z - other.z), 2));
  }
}

double triangleArea(Point p1, Point p2, Point p3) {
  double result = (p2.x - p1.x) * (p3.y - p1.y) - (p3.x - p1.x) * (p2.y - p1.y);
  if (result < 0) {
    result *= -1;
  }
  return result / 2;
}
