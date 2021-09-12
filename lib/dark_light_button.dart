library dark_light_button;

import 'package:dark_light_button/src/darlights_enum.dart';
import 'package:dark_light_button/src/mixins.dart';
import 'package:dark_light_button/src/options.dart';
import 'package:dark_light_button/widgets/darlight_1.dart';
import 'package:dark_light_button/widgets/darlight_2.dart';
import 'package:dark_light_button/widgets/darlight_3.dart';
import 'package:dark_light_button/widgets/switcher.dart';
import 'package:flutter/material.dart';
import 'package:sprung/sprung.dart';
export 'package:dark_light_button/src/darlights_enum.dart';
export 'package:dark_light_button/src/options.dart';

class DarlightButton extends StatelessWidget {
  const DarlightButton({
    Key? key,
    this.type = Darlights.DarlightThree,
    required this.onChange,
    this.options,
    this.height,
    this.animationDuration,
  }) : super(key: key);

  final Darlights type;
  final Function(ThemeMode) onChange;
  final DarlightOption? options;
  final double? height;
  final Duration? animationDuration;

  @override
  Widget build(BuildContext context) {
    switch (type) {
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
      default:
        return SizedBox();
    }
  }
}
