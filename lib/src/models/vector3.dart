import 'dart:math';

class Vector3 {


  double _x;
  double _y;
  double _z;


  Vector3(this._x, this._y, this._z);

  double get x => _x;
  double get y => _y;
  double get z => _z;

  void setX(double x) => _x = x;
  void setY(double y) => _y = y;


  static Vector3 fromDirection(double magnitude, double direction1, double direction2) {
    return Vector3(
      magnitude*sin(direction2)*cos(direction1),
      magnitude*sin(direction2)*sin(direction1),
      magnitude*cos(direction2)
      );
  }


  double dotProduct(Vector3 other) {
    return (_x*other.x) + (_y*other.y) + (_z*other.z);
  }

  Vector3 add(double x, double y, double z) {
    return Vector3(_x+x, _y+y, _z+z);
  }

  Vector3 addVector(Vector3 other) {
    return Vector3(_x+other.x, _y+other.y, _z + other.z);
  }

  


}