import 'dart:math';

class Point {
  // Instance Variables
  var x;
  var y;

  // Constructor with optional and default parameters
  Point([var numX = 0, var numY = 0]) {
    this.x = numX;
    this.y = numY;
  }

  // COnstructor with Class-Name.Identifier-Name
  Point.fromPoint(Point origin) {
    this.x = origin.x;
    this.y = origin.y;
  }

  // Instance method to calculate distance
  num distanceTo(Point other) {
    var dx = this.x - other.y;
    var dy = this.y - other.y;
    return sqrt(dx * dx + dy * dy);
  }

  // Getter
  String get stringify => "(${this.x},${this.y})";

  // Setter
  set increaseX(num value) => this.x += value;
  set increaseY(num value) => this.y += value;
}

class ColorPoint extends Point {
  int red = 0;
  int green = 0;
  int blue = 0;

  ColorPoint([int r = 0, int g = 0, int b = 0, int x = 0, int y = 0])
      : super(x, y) {
    this.red = r;
    this.green = g;
    this.blue = b;
  }

  // Getter
  @override
  String get stringify =>
      "${super.stringify} with (${this.red},${this.green},${this.red})";

  // Overriding generic operators
  ColorPoint operator +(ColorPoint p) =>
      ColorPoint(255, 255, 255, this.x + p.x, this.y + p.y);
}
