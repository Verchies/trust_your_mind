import 'package:flutter/material.dart';
import 'package:trust_your_mind/Material/materials.dart';

class boxes2 extends StatelessWidget {
  Color? color;

  boxes2({this.color, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.5),
      child: Ink(
        color: Colors.brown[300],
        width: materials.boxSize2,
        height: materials.boxSize2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100), color: color),
          ),
        ),
      ),
    );
  }
}
