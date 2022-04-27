import 'package:animated_widgets/animated_widgets.dart';
import 'package:flutter/material.dart';

class fadeAnimate extends StatelessWidget {
  fadeAnimate({Key? key, required this.widget, required this.isVisible})
      : super(key: key);

  Widget widget;
  bool isVisible;

  @override
  Widget build(BuildContext context) {
    return OpacityAnimatedWidget.tween(
        opacityEnabled: 1,
        opacityDisabled: 0,
        enabled: isVisible,
        child: widget);
  }
}
