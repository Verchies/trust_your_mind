import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class arrows extends StatelessWidget {
  late double top;
  late double bottom;

  arrows({Key? key, required this.top, required this.bottom}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: top, bottom: bottom),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          Icon(
            Icons.arrow_downward_rounded,
            size: 31,
          ),
          Icon(Icons.arrow_downward_rounded, size: 31),
        ],
      ),
    );
  }
}
