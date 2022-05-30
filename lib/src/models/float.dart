
import 'dart:math';

class Float {

  late int _sig;
  late int _exp;

  static Float fromInt(int v) {
    return Float._().._setSig(v).._setExp(0);
  }

  static Float fromDouble(double v) {

    String s = v.toString();
    int e = s.split(".")[1].length*-1;
    int sig = int.parse(s.replaceAll(".", "")); 


    return Float._().._setSig(sig).._setExp(e);

  }

  Float._() {
    _sig = 0;
    _exp = 0;   
  }


  double toDouble() {
    return (_sig*pow(10,_exp)).toDouble();
  }

  @override
  String toString() {
    return "${this.toDouble()}";
  }


  void _setSig(int v) => _sig = v;
  void _setExp(int v) => _exp = v;



  @override
  bool operator ==(covariant Float other) => _sig == other._sig && _exp == other._exp;

  Float operator +(covariant Float other) {

    return this;
  }

}