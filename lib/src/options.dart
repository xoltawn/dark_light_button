import 'package:flutter/material.dart';

/// exclusive options for each type of button, named after thw button itself
abstract class DarlightOption {}

class DarlightThreeOption extends DarlightOption {
  DarlightThreeOption({
    required this.arcFactor,
    this.darkBackGroundColor = const Color(0xff27173a),
    this.lightBackGroundColor = const Color(0xff27173a),
    this.darkMoonColor = const Color(0xffffc207),
    this.lightMoonColor = const Color(0xffffc207),
  }) : assert(arcFactor >= 0 && arcFactor <= 1);

  /// determines how full the moon is, it should be between 0 and 1
  final double arcFactor;
  final Color darkBackGroundColor;
  final Color lightBackGroundColor;
  final Color darkMoonColor;
  final Color lightMoonColor;
}

class DarlightTwoOption extends DarlightOption {
  DarlightTwoOption({
    this.darkBackGroundColor = const Color(0xff27173a), //
    this.lightBackGroundColor = Colors.white, //
    this.darkIconColor = const Color(0xffffc207), //
    this.lightIconColor = const Color(0xffffbb52), //
    this.lightBorderColor = const Color(0xffe9ecef), //
    this.darkBorderColor = Colors.white, //
  });

  final Color darkBackGroundColor;
  final Color lightBackGroundColor;
  final Color darkIconColor;
  final Color lightIconColor;
  final Color lightBorderColor;
  final Color darkBorderColor;
}

class DarlightOneOption extends DarlightOption {
  DarlightOneOption({
    this.darkBackGroundColor = const Color(0xff27173a),
    this.lightBackGroundColor = Colors.white,
    this.darkIconColor = Colors.black,
    this.lightIconColor = Colors.orangeAccent,
    this.lightIconBackgroundColor = Colors.black,
    this.darkIconBackgroundColor = Colors.white,
  });

  final Color darkBackGroundColor;
  final Color lightBackGroundColor;
  final Color darkIconColor;
  final Color lightIconColor;
  final Color lightIconBackgroundColor;
  final Color darkIconBackgroundColor;
}

class DarlightFourOption extends DarlightOption {
  DarlightFourOption({
    this.darkIconColor =  Colors.white, //
    this.lightIconColor =  Colors.orange, //
  });

  final Color darkIconColor;
  final Color lightIconColor;
}