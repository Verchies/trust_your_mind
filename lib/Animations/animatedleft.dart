import 'package:animated_widgets/animated_widgets.dart';
import 'package:flutter/material.dart';

class animatedLeft extends StatelessWidget {
  animatedLeft({Key? key, required this.widget}) : super(key: key);

  Widget widget;

  @override
  Widget build(BuildContext context) {
    return TranslationAnimatedWidget.tween(
      enabled: true,
      delay: const Duration(milliseconds: 310),
      duration: const Duration(milliseconds: 750),
      translationDisabled: const Offset(-531, 0),
      translationEnabled: const Offset(0, 0),
      child: OpacityAnimatedWidget.tween(
          enabled: true, opacityDisabled: 0, opacityEnabled: 1, child: widget),
    );
  }
}
