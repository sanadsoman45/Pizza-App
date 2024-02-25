import 'dart:ui';

import 'package:flutter/material.dart';

class ColorManager{

  static Color generateColor(List<Color> colors, {required double opacity}) {

    int red = 0;
    int green = 0;
    int blue = 0;

    for (Color color in colors) {
      red += int.parse(color.red.toRadixString(16), radix: 16);
      green += int.parse(color.green.toRadixString(16), radix: 16);
      blue += int.parse(color.blue.toRadixString(16), radix: 16);
    }

    red = (red ~/ colors.length).clamp(0, 255);
    green = (green ~/ colors.length).clamp(0, 255);
    blue = (blue ~/ colors.length).clamp(0, 255);

    return Color.fromRGBO(red, green, blue, opacity);
  }
}