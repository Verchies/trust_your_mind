import 'package:flutter/material.dart';

class materials {
  // Colors
  static Color textColor = const Color(0xFFC4C4C4);
  static Color backgroundColor = const Color(0xFF4B3131);
  static Color closedColor = Colors.black;
  static Color splashColor = Colors.white;
  static Color fakeColor = const Color.fromARGB(255, 161, 11, 0);
  static Color boxColor = const Color.fromARGB(255, 255, 17, 0);

  // Level Up
  static int level1 = 10;
  static int level2 = 20;
  static int level3 = 30;

  static int level4 = 0;

  // animation delay
  static var delayList = [
    900,
    1000,
    1150,
    1300,
    1450,
    1600,
    1750,
    1900,
    2000,
    2100,
    2200
  ];

  // unchangable color
  static Color fakeBoxColor = materials.fakeColor;

  // Sounds
  static String tapSound = "tapSound.mp3";
  static String tapSound2 = "tapSoundclassic.mp3";
  static String gameOver = "loseffect.mp3";
  static String winSound = "winSound.mp3";
  static String timeAlert = "timeAlert.mp3";
  static String tutorialSound = "tutorialAlert.mp3";

  // Stage timer
  static int stageTimer = 3800;

  // Box Sizes
  static double boxSize1 = 85;
  static double boxSize2 = 72;

  // Texts
  static Widget title = Text(
    "Trust Your \n Mind",
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 50,
      color: materials.textColor,
      fontFamily: 'gamefont',
    ),
  );
}

// for the remove scroll effect
class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
