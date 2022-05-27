
import 'dart:math';

class Vector2 {

  double _x;
  double _y;

  Vector2(this._x, this._y);

  static Vector2 fromDirection(double magnitude, double direction) {
    return Vector2(magnitude*cos(direction), magnitude*sin(direction));
  }

  double get x => _x;
  double get y => _y;

  void setX(double x) => _x = x;
  void setY(double y) => _y = y;

  double direction() {
    return atan2(_y,_x);
  }

  double dotProduct(Vector2 other) {
    return (_x*other.x) + (_y*other.y);
  }

  Vector2 add(double x, double y) {
    return Vector2(_x+x, _y+y);
  }

  Vector2 addVector(Vector2 other) {
    return Vector2(_x+other.x, _y+other.y);
  }


}