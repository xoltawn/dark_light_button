import 'package:flutter/material.dart';

mixin DarkMixin {
  bool isLightTheme(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light;
  }

  Color getColorByTheme(
      {required Color light,
        required Color dark,
        required BuildContext context}) {
    return isLightTheme(context) ? light : dark;
  }
}
