import 'dart:math';

double roundTo(double value, int precision) => (value * pow(10,precision)).round() / pow(10,precision);