import 'package:dark_light_button/src/mixins.dart';
import 'package:dark_light_button/src/options.dart';
import 'package:dark_light_button/widgets/switcher.dart';
import 'package:flutter/material.dart';
import 'package:sprung/sprung.dart';

class DarlightFour extends StatefulWidget {
  DarlightFour({
    Key? key,
    required this.onChange,
    this.height = 40,
    required this.duration,
    this.options,
  });

  final Function(ThemeMode) onChange;
  final double height;
  final Duration duration;
  final DarlightFourOption? options;

  @override
  _DarlightFourState createState() => _DarlightFourState();
}

class _DarlightFourState extends State<DarlightFour>
    with SingleTickerProviderStateMixin, DarkMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double get width => widget.height * 2.5;

  double get insidePadding => widget.height / 6;

  double get circleRadius => widget.height - (insidePadding * 2);

  DarlightFourOption _getOption() {
    return widget.options ?? DarlightFourOption();
  }

  @override
  Widget build(BuildContext context) {
    return DarlightSwitcher(
        onChange: (theme) {
          widget.onChange(theme);
          if (theme == ThemeMode.dark) {
            _controller.forward();
          } else {
            _controller.reverse();
          }
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(widget.height),
          child: Container(
              height: widget.height,
              width: width,
              child: Stack(
                children: [
                  Container(
                    decoration:
                    BoxDecoration(
                      image: DecorationImage(image: AssetImage(
                          isLightTheme(context)
                              ? 'assets/images/day.png'
                              : 'assets/images/night.png',
                          package: 'dark_light_button'))
                    ),
                  ),
                  AnimatedAlign(
                    curve: Sprung(14),
                    duration: widget.duration,
                    alignment: isLightTheme(context)
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: insidePadding),
                      height: circleRadius,
                      width: circleRadius,
                      decoration: BoxDecoration(
                          color: getColorByTheme(
                              dark: _getOption().darkIconColor,
                              light: _getOption().lightIconColor,
                              context: context),
                          shape: BoxShape.circle),
                    ),
                  ),

                ],
              )),
        ));
  }
}
