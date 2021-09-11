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

class DarlightButton extends StatelessWidget {
  const DarlightButton({
    Key? key,
    this.type = Darlights.DarlightOne,
    required this.onChange,
    this.options,
    this.height = 40,
    this.animationDuration,
  }) : super(key: key);

  final Darlights type;
  final Function(ThemeMode) onChange;
  final DarlightOption? options;
  final double height;
  final Duration? animationDuration;

  final Duration _defaultDuration = const Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case Darlights.DarlightOne:
        return DarlightOne(
          onChange: onChange,
          height: height,
          duration: animationDuration ?? _defaultDuration,
          options: options as DarlightOneOption?,
        );
      case Darlights.DarlightTwo:
        return DarlightTwo(
          onChange: onChange,
          height: height,
          duration: animationDuration ?? Duration(milliseconds: 800),
          options: options as DarlightTwoOption?,
        );
      case Darlights.DarlightThree:
        return DarlightThree(
          onChange: onChange,
          height: height,
          duration: animationDuration ?? Duration(milliseconds: 800),
          options: options as DarlightThreeOption?,
        );
      default:
        return SizedBox();
    }
  }
}





