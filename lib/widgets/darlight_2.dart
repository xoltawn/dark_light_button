import 'package:dark_light_button/src/mixins.dart';
import 'package:dark_light_button/src/options.dart';
import 'package:dark_light_button/widgets/switcher.dart';
import 'package:flutter/material.dart';
import 'package:sprung/sprung.dart';

class DarlightTwo extends StatefulWidget {
  DarlightTwo({
    Key? key,
    required this.onChange,
    this.height = 40,
    required this.duration,
    this.options,
  });

  final Function(ThemeMode) onChange;
  final double height;
  final Duration duration;
  final DarlightTwoOption? options;

  @override
  _DarlightTwoState createState() => _DarlightTwoState();
}

class _DarlightTwoState extends State<DarlightTwo>
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

  double get circleRadius => widget.height - (insidePadding * 2);

  DarlightTwoOption _getOption() {
    return widget.options ?? DarlightTwoOption();
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
              decoration: BoxDecoration(
                color: getColorByTheme(
                    dark: _getOption().darkBackGroundColor,
                    light: _getOption().lightBackGroundColor,
                    context: context),
              ),
              child: Stack(
                children: [
                  AnimatedAlign(
                    curve: Sprung(14),
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
                              dark: _getOption().darkIconColor,
                              light: _getOption().lightIconColor,
                              context: context),
                          shape: BoxShape.circle),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: insidePadding),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: AnimatedOpacity(
                          opacity: isLightTheme(context) ? 0 : 1,
                          duration: Duration(milliseconds: 200),
                          child: Icon(Icons.dark_mode),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: insidePadding),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: AnimatedOpacity(
                          opacity: isLightTheme(context) ? 1 : 0,
                          duration: Duration(milliseconds: 200),
                          child: Icon(
                            Icons.wb_sunny,
                            color: Colors.orangeAccent,
                          ),
                        )),
                  ),
                ],
              )),
        ));
  }
}



