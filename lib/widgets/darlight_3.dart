
import 'package:dark_light_button/src/mixins.dart';
import 'package:dark_light_button/src/options.dart';
import 'package:dark_light_button/widgets/switcher.dart';
import 'package:flutter/material.dart';
import 'package:sprung/sprung.dart';

class DarlightThree extends StatefulWidget {
  DarlightThree({
    Key? key,
    required this.onChange,
    this.height = 30,
    required this.duration,
    this.options,
  });

  final Function(ThemeMode) onChange;
  final double height;
  final Duration duration;
  final DarlightThreeOption? options;

  @override
  _DarlightThreeState createState() => _DarlightThreeState();
}

class _DarlightThreeState extends State<DarlightThree>
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

  double get width => widget.height * 2;

  double get insidePadding => widget.height / 6;

  double get circleRadius => widget.height + insidePadding;

  DarlightThreeOption _getOption() {
    return widget.options ?? DarlightThreeOption();
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
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(widget.height),
              child: Container(
                // duration: widget.duration,
                height: widget.height,
                width: width,
                decoration: BoxDecoration(
                  color: getColorByTheme(
                      dark: _getOption().darkBackGroundColor,
                      light: _getOption().lightBackGroundColor,
                      context: context),
                ),
              ),
            ),

            AnimatedAlign(
              curve: Sprung(14),
              duration: widget.duration,
              alignment: isLightTheme(context)
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              child: AnimatedContainer(
                duration: widget.duration,
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
        )
    );
  }
}