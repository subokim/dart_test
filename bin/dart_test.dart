class Point {
  // Instance Variables
  var x;
  var y;

  // Constructor with optional and default parameters
  Point([this.x = 0, this.y = 0]) {}
}

class Logger {
  final String name;
  bool mute = false;

  // _cache is library-private, thanks to
  // the _ in front of its name.
  static final Map _cache = {};

  factory Logger(String name) => _cache.putIfAbsent(name, () => Logger._internal(name));

  Logger._internal(this.name);

  void log(String msg) {
    if (!mute) print(msg);
  }

  static get cacheLength => _cache.length;
}

// Enumerated Types
enum Color { red, green, blue }

void main() {
  // ?. Operator
  var p0;
  p0?.x = 0;
  p0?.y = 0;
  print("[01]\$ $p0");

  // Initialization List
  var p1 = Point(3, 4);
  var p2 = Point();
  print("[02]\$ (${p1.x},${p1.y})");
  print("[03]\$ (${p2.x},${p2.y})");

  // Factory Constructor
  var logger1 = Logger('UI');
  var logger2 = Logger('UI');
  print("[04]\$ ${Logger.cacheLength}");
  logger1.log('[05]\$ [object:${logger1.hashCode}] Button clicked');
  logger2.log('[06]\$ [object:${logger2.hashCode}] Button clicked');

  // Enumerated Types
  print("[07]\$ ${Color.red.index} ${Color.green.index} ${Color.blue.index}");
  var aColor = Color.blue;
  switch (aColor) {
    case Color.red:
      print('[08]\$ Red as roses!');
      break;
    case Color.green:
      print('[08]\$ Green as grass!');
      break;
    default: // Without this, you see a WARNING.
      print('[08]\$ ${aColor}'); // 'Color.blue'
  }
}
