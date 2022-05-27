
import 'noise/perlin/perlin.dart';

class Noise {

  static Perlin _perlin = Perlin();


  static int _seed = DateTime.now().millisecond;
  static int get seed => _seed;
  static void setSeed(int seed) => _seed = seed;

  static double _magnitude = 1;
  static double get magnitude => _magnitude;
  static void setMagnitude(double magnitude) => _magnitude = magnitude;

  static double perlin2d(double x, double y) {
    return _perlin.perin2d(x, y, seed, magnitude);
  }

  static double perlin3d(double x, double y, double z) {
    return _perlin.perlin3d(x, y, z, seed, magnitude);
  }

}