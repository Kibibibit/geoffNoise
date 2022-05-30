import 'dart:math';

class Float {

  late int _sig;
  late int _exp;

  static Float fromInt(int v) {
    return Float._(0,0).._setSig(v).._setExp(0);
  }

  static Float fromDouble(double v) {

    String s = v.toString();
    int e = s.split(".")[1].length*-1;
    int sig = int.parse(s.replaceAll(".", "")); 


    return Float._(0,0).._setSig(sig).._setExp(e);

  }

  Float._(this._sig, this._exp);


  double toDouble() {
    return (_sig*pow(10,_exp)).toDouble();
  }

  @override
  String toString() {
    return "${this.toDouble()}";
  }


  void _setSig(int v) => _sig = v;
  void _setExp(int v) => _exp = v;

  Float abs() {
    return Float._(_sig.abs(), _exp);
  }

  Float inverseAbs() {
    return Float._(_sig.abs()*-1, _exp);
  }



  @override
  bool operator ==(covariant Float other) => _sig == other._sig && _exp == other._exp;

  Float operator +(covariant Float other) {

    Float higher;
    Float lower;

    if (this._exp > other._exp) {
      higher = Float._(this._sig, this._exp);
      lower = Float._(other._sig, other._exp);
    } else {
      higher = Float._(other._sig, other._exp);
      lower = Float._(this._sig, this._exp);
    }


    while (higher._exp != lower._exp) {
      higher._exp--;
      higher._sig *= 10;
    }

    higher._sig += lower._sig;



    return Float._(higher._sig, higher._exp);
  }

  Float operator -(covariant Float other) {
    return this + other.inverseAbs();
  }

  Float operator *(covariant Float other) {

    int sig = _sig*other._sig;
    int exp = _exp+other._exp;

    return Float._(sig, exp);

  }

  Float operator /(covariant Float other) {
    int exp = _exp-other._exp;


    double sig = _sig/other._sig;

    print(exp);
    print(sig);

    return this;

  }


}