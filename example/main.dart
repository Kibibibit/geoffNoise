
import 'dart:io';

import 'package:geoffNoise/geoff_noise.dart';
import 'package:image/image.dart';

void main() {

  int width = 100;
  int height = 100;

  int cellX = 20;
  int cellY = 20;

  Image image = Image(width, height);

  Float test = Float.fromDouble(4.73);
  Float test2 = Float.fromDouble(5.41);

  print(test.toExpString());
  print(test2.toExpString());

  print(test/test2);


  // Noise.setSeed(0);

  // for (int y = 0; y < height; y++) {
  //   for (int x = 0; x < width; x++) {
      
  //     double perlin = Noise.perlin2d(x/cellX, y/cellY);
  //     int d = ((perlin+1)*0.5*255).round();

  //     //print("${x/cellX}, ${y/cellY} => $d ($perlin)");

  //     image.setPixelRgba(x, y, d, d, d);
  //   }
  // }

  // File('test.png').writeAsBytesSync(encodePng(image));


}