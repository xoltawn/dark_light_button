library dark_light_button;

import 'package:dark_light_button/src/darlights_enum.dart';
import 'package:dark_light_button/src/mixins.dart';
import 'package:dark_light_button/src/options.dart';
import 'package:dark_light_button/widgets/darlight_3.dart';
import 'package:dark_light_button/widgets/darlight_2.dart';
import 'package:dark_light_button/widgets/darlight_1.dart';
import 'package:dark_light_button/widgets/darlight_4.dart';
import 'package:dark_light_button/widgets/switcher.dart';
import 'package:flutter/material.dart';
import 'package:sprung/sprung.dart';
export 'package:dark_light_button/src/darlights_enum.dart';
export 'package:dark_light_button/src/options.dart';

/// this is the widget which is gonna be used to create the buttob by user
class DarlightButton extends StatelessWidget {
  const DarlightButton({
    Key? key,
    this.type = Darlights.DarlightThree,
    required this.onChange,
    this.options,
    this.height,
    this.animationDuration,
  }) : super(key: key);

  /// the type of button, which is a enum containing available buttons, you can find the image for each one on the readme file.
  final Darlights type;

  /// callback which specifies the theme , you must put your update theme logic inside this
  final Function(ThemeMode) onChange;

  /// each button type has its own specific options, which is named after the type,
  /// for example: Darlights.DarlightThree takes DarlightThreeOption as option..
  final DarlightOption? options;

  ///the height of button
  final double? height;

  /// the duration of animation
  final Duration? animationDuration;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case Darlights.DarlightOne:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DarlightOne(
              onChange: onChange,
              height: height ?? 20,
              duration: animationDuration ?? Duration(milliseconds: 500),
              options: options as DarlightOneOption?,
            )
          ],
        );
      case Darlights.DarlightTwo:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DarlightTwo(
              onChange: onChange,
              height: height ?? 30,
              duration: animationDuration ?? Duration(milliseconds: 500),
              options: options as DarlightTwoOption?,
            )
          ],
        );
      case Darlights.DarlightThree:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DarlightThree(
              onChange: onChange,
              height: height ?? 30,
              duration: animationDuration ?? const Duration(milliseconds: 300),
              options: options as DarlightThreeOption?,
            )
          ],
        );
      case Darlights.DarlightFour:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DarlightFour(
              onChange: onChange,
              height: height ?? 35,
              duration: animationDuration ?? Duration(milliseconds: 500),
              options: options as DarlightFourOption?,
            )
          ],
        );
      default:
        return SizedBox();
    }
  }
}
