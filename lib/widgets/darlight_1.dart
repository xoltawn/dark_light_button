
import 'package:dark_light_button/src/mixins.dart';
import 'package:dark_light_button/src/options.dart';
import 'package:dark_light_button/widgets/switcher.dart';
import 'package:flutter/material.dart';

class DarlightOne extends StatefulWidget {
  DarlightOne({
    Key? key,
    required this.onChange,
    this.height = 40,
    required this.duration,
    this.options,
  });

  final Function(ThemeMode) onChange;
  final double height;
  final Duration duration;
  final DarlightOneOption? options;

  @override
  _DarlightOneState createState() => _DarlightOneState();
}

class _DarlightOneState extends State<DarlightOne>
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

  double get insidePadding => widget.height / 10;

  double get circleRadius => widget.height - (insidePadding * 2);

  double get secondCircleRadius => circleRadius - insidePadding;

  DarlightOneOption _getOption() {
    return widget.options ?? DarlightOneOption(arcFactor: 1);
  }

  double _convertArcFactor() {
    return (_getOption().arcFactor * 2) + 2;
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
          child: AnimatedContainer(
              duration: widget.duration,
              height: widget.height,
              width: width,
              decoration: BoxDecoration(
                color: getColorByTheme(
                    dark: _getOption().darkBackGroundColor,
                    light: _getOption().lightBackGroundColor,
                    context: context),
              ),
              child: Stack(
                children: [
                  AnimatedAlign(
                    duration: widget.duration,
                    alignment: isLightTheme(context)
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    child: AnimatedContainer(
                      duration: widget.duration,
                      margin: EdgeInsets.symmetric(horizontal: insidePadding),
                      height: circleRadius,
                      width: circleRadius,
                      decoration: BoxDecoration(
                          color: getColorByTheme(
                              dark: _getOption().darkMoonColor,
                              light: _getOption().lightMoonColor,
                              context: context),
                          shape: BoxShape.circle),
                    ),
                  ),
                  AnimatedPositioned(
                    top: insidePadding +
                        ((circleRadius - secondCircleRadius) / 2),
                    left: isLightTheme(context)
                        ? -circleRadius
                        : width -
                        insidePadding -
                        (circleRadius / _convertArcFactor()) -
                        secondCircleRadius,
                    duration: widget.duration,
                    child: Container(
                      // margin: EdgeInsets.only(top: insidePadding),
                      height: secondCircleRadius,
                      width: secondCircleRadius,
                      decoration: BoxDecoration(
                          color: getColorByTheme(
                              dark: _getOption().darkBackGroundColor,
                              light: _getOption().lightBackGroundColor,
                              context: context),
                          shape: BoxShape.circle),
                    ),
                  )
                ],
              )),
        ));
  }
}