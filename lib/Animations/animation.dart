import 'package:animated_widgets/animated_widgets.dart';
import 'package:flutter/material.dart';

class animate extends StatelessWidget {
  animate({
    Key? key,
    required this.widget,
    required this.delay,
  }) : super(key: key);

  late Widget widget;
  late int delay;

  @override
  Widget build(BuildContext context) {
    return TranslationAnimatedWidget.tween(
      enabled: true,
      delay: Duration(milliseconds: delay),
      duration: const Duration(milliseconds: 750),
      translationDisabled: const Offset(00, -531),
      translationEnabled: const Offset(00, 00),
      child: OpacityAnimatedWidget.tween(
          enabled: true, opacityDisabled: 0, opacityEnabled: 1, child: widget),
    );
  }
}
