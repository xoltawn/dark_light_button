import 'package:dark_light_button/src/mixins.dart';
import 'package:dark_light_button/src/options.dart';
import 'package:dark_light_button/widgets/switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sprung/sprung.dart';

class DarlightOne extends StatefulWidget {
  DarlightOne({
    Key? key,
    required this.onChange,
    this.height = 20,
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

  double get width => widget.height * 2.5;

  double get insidePadding => widget.height / 6;

  double get circleRadius => widget.height + (widget.height / 2);

  DarlightOneOption _getOption() {
    return widget.options ?? DarlightOneOption();
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
        child: Container(
          width: width,
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
                child: Container(
                  height: circleRadius,
                  width: circleRadius,
                  decoration: BoxDecoration(
                      color: getColorByTheme(
                          dark: _getOption().darkIconBackgroundColor,
                          light: _getOption().lightIconBackgroundColor,
                          context: context),
                      shape: BoxShape.circle),
                  child: Icon(isLightTheme(context)
                      ? Icons.wb_sunny
                      : Icons.dark_mode,
                    color: isLightTheme(context) ? _getOption().lightIconColor : _getOption().darkIconColor,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
