import 'package:animated_widgets/animated_widgets.dart';
import 'package:flutter/material.dart';
import 'package:trust_your_mind/Material/altboxes.dart';
import 'package:trust_your_mind/Material/materials.dart';

class animatedboxes extends StatelessWidget {
  const animatedboxes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TranslationAnimatedWidget.tween(
      enabled: true,
      delay: const Duration(milliseconds: 31),
      duration: const Duration(milliseconds: 750),
      translationDisabled: const Offset(0, 531),
      translationEnabled: const Offset(0, 0),
      child: OpacityAnimatedWidget.tween(
        enabled: true,
        opacityDisabled: 0,
        opacityEnabled: 1,
        child: altBoxes(
          color: materials.closedColor,
        ),
      ),
    );
  }
}
