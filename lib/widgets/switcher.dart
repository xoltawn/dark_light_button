import 'package:dark_light_button/src/mixins.dart';
import 'package:flutter/material.dart';

///Darlight widgets are placed inside this widget, so changing theme happens here for all darlight widgets
class DarlightSwitcher extends StatefulWidget {
  const DarlightSwitcher(
      {Key? key, required this.onChange, required this.child})
      : super(key: key);

  final Widget child;
  final Function(ThemeMode) onChange;

  @override
  _DarlightSwitcherState createState() => _DarlightSwitcherState();
}

class _DarlightSwitcherState extends State<DarlightSwitcher> with DarkMixin {
  bool _isLight = false;

  @override
  void didChangeDependencies() {
    _isLight = isLightTheme(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChange(_isLight ? ThemeMode.dark : ThemeMode.light);
      },
      child: widget.child,
    );
  }
}
