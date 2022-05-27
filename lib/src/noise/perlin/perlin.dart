
import 'dart:math';
import '../../models/vector2.dart';
import '../../models/vector3.dart';
import '../utils/interpolate.dart';

class Perlin {

  double perin2d(double x, double y, int seed, double magnitude) {

    int x0 = x.floor();
    int y0 = y.floor();
    int x1 = x0+1;
    int y1 = y0+1;

    double sX = x-x0;
    double sY = y-y0;

    double n0 = _dotGridGradient2(x0, y0, x, y, seed, magnitude);
    double n1 = _dotGridGradient2(x1, y0, x, y, seed, magnitude);
    
    double ix0 = interpolate(n0, n1, sX);

    n0 = _dotGridGradient2(x0, y1, x, y, seed, magnitude);
    n1 = _dotGridGradient2(x1, y1, x, y, seed, magnitude);
    
    double ix1 = interpolate(n0, n1, sX);

    return interpolate(ix0, ix1, sY);
  }


  double perlin3d(double x, double y, double z, int seed, double magnitude) {

    int x0 = x.floor();
    int y0 = y.floor();
    int z0 = z.floor();

    int x1 = x0+1;
    int y1 = y0+1;
    int z1 = z0+1;

    double sX = x-x0;
    double sY = y-y0;
    double sZ = z-z0;

    double n0 = _dotGridGradient3(x0, y0, z0, x, y, z, seed, magnitude);
    double n1 = _dotGridGradient3(x1, y0, z0, x, y, z, seed, magnitude);

    double ix0 = interpolate(n0, n1, sX);

    n0 = _dotGridGradient3(x0, y1, z0, x, y, z, seed, magnitude);
    n1 = _dotGridGradient3(x1, y1, z0, x, y, z, seed, magnitude);

    double ix1 = interpolate(n0, n1, sX);

    n0 = _dotGridGradient3(x0, y0, z1, x, y, z, seed, magnitude);
    n1 = _dotGridGradient3(x1, y0, z1, x, y, z, seed, magnitude);

    double ix2 = interpolate(n0, n1, sX);

    n0 = _dotGridGradient3(x0, y1, z1, x, y, z, seed, magnitude);
    n1 = _dotGridGradient3(x1, y1, z1, x, y, z, seed, magnitude);

    double ix3 = interpolate(n0, n1, sX);

    double iy0 = interpolate(ix0, ix1, sY);
    double iy1 = interpolate(ix2, ix3, sY);

    return interpolate(iy0, iy1, sZ);

  }

  static double _roundTo(double value, int precision) => (value * pow(10,precision)).round() / (10* pow(10,precision));

  static double _dotGridGradient2(int ix, int iy, double x, double y, int seed, double magnitude) {
    Vector2 gradient = _randomVector2(ix, iy, seed, magnitude);
    Vector2 dist = Vector2(_roundTo(x-ix,5), _roundTo(y-iy, 5));
    print ("$x, $y, $ix, $iy, $dist");
    return gradient.dotProduct(dist);
  }

  static double _dotGridGradient3(int ix, int iy, int iz, double x, double y, double z, int seed, double magnitude) {
    Vector3 gradient = _randomVector3(ix, iy, iz, seed, magnitude);
    Vector3 dist = Vector3(x-ix, y-iy, z-iz);
    return gradient.dotProduct(dist);
  }

  static Vector2 _randomVector2(int x, int y, int seed, double magnitude) {
    int _seed = "$x:$y".hashCode + seed;
    return Vector2.fromDirection(magnitude, Random(_seed).nextDouble()*pi*2);
  }

  static Vector3 _randomVector3(int x, int y, int z, int seed, double magnitude) {
    int _seed = "$x:$y:$z".hashCode + seed;
    Random r = Random(_seed);
    return Vector3.fromDirection(magnitude, r.nextDouble()*2*pi, r.nextDouble()*2*pi);
    
  }

}





