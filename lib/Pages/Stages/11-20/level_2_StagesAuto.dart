import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trust_your_mind/Animations/animatedleft.dart';
import 'package:trust_your_mind/Material/boxes.dart';
import 'package:trust_your_mind/Material/fakebox.dart';
import 'package:trust_your_mind/Material/materials.dart';
import 'package:trust_your_mind/Methods/holdpoints.dart';
import 'package:trust_your_mind/Pages/Stages/21-30/level_3_StagesAuto.dart';
import 'package:trust_your_mind/Pages/mainPage.dart';
import 'package:trust_your_mind/Animations/animatedboxes.dart';
import 'package:trust_your_mind/Animations/animatedfakebox.dart';
import 'package:trust_your_mind/Animations/animation.dart';
import 'package:trust_your_mind/Animations/fadeanimation.dart';

class level_2_Stages extends StatefulWidget {
  const level_2_Stages({Key? key}) : super(key: key);

  static var boxTimer2 = false;

  @override
  State<level_2_Stages> createState() => _level_2_StagesState();
}

class _level_2_StagesState extends State<level_2_Stages>
    with TickerProviderStateMixin {
  final _audioCache = AudioCache(
      prefix: 'assets/Sounds/',
      fixedPlayer: AudioPlayer(mode: PlayerMode.LOW_LATENCY));
  void tapSound() {
    mainPage.sounds == true ? _audioCache.play(materials.tapSound) : null;
  }

  void tapSound2() {
    mainPage.sounds == true ? _audioCache.play(materials.tapSound2) : null;
  }

  void tutorialAlert() {
    mainPage.sounds == true ? _audioCache.play(materials.tutorialSound) : null;
  }

  var randomList = [
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
  ];

  List<Widget> widgetList() {
    return [
      box1(),
      box2(),
      box3(),
      box4(),
      box5(),
      box6(),
      box7(),
      box8(),
      box9(),
      box10(),
      box11(),
      box12(),
      box13(),
      box14(),
      box15(),
      box16(),
    ];
  }

  late var random = randomList[0];
  late var random2 = randomList[1];
  late var random3 = randomList[2];
  late var random4 = randomList[3];
  late var random5 = randomList[4];
  late var random6 = randomList[5];
  late var random7 = randomList[6];
  late var random8 = randomList[7];
  late var random9 = randomList[8];
  late var random10 = randomList[9];
  late var random11 = randomList[10];
  late var random12 = randomList[11];
  late var random13 = randomList[12];
  late var random14 = randomList[13];
  late var random15 = randomList[14];
  late var random16 = randomList[15];

  @override
  void initState() {
    setState(() {
      mainPage.levelUp = mainPage.levelUp + 1;
      mainPage.isClicked1 = false;
      mainPage.isClicked2 = false;
      mainPage.isClicked3 = false;
      mainPage.isClicked4 = false;
      mainPage.isClicked5 = false;
      mainPage.isClicked6 = false;
      mainPage.isClicked7 = false;

      mainPage.pickColor1 = materials.boxColor;
      mainPage.pickColor2 = materials.boxColor;
      mainPage.pickColor3 = materials.boxColor;
      mainPage.pickColor4 = materials.boxColor;
      mainPage.pickColor5 = materials.boxColor;
      mainPage.pickColor6 = materials.boxColor;
      mainPage.pickColor7 = materials.boxColor;

      mainPage.safety = false;
      level_2_Stages.boxTimer2 = false;
      materials.fakeBoxColor = materials.fakeColor;
      holdPoints();
      randomList.shuffle();
    });
    super.initState();
  }

  void tutorial() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setBool('showTutorial2', false);
    });
  }

  void win2() {
    Future.delayed(const Duration(milliseconds: 31), () {
      _audioCache.play('winSound.mp3');
    });
  }

  void win() {
    Future.delayed(const Duration(milliseconds: 31), () {
      if (mainPage.points == 0 &&
          mainPage.levelUp <= materials.level2 &&
          mainPage.sounds == true) {
        _audioCache.play('winSound.mp3');
      }
    });
  }

  loadScores() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      mainPage.scoreBalance = prefs.getInt('scoreBalance') ?? 0;
      mainPage.showTutorial2 = prefs.getBool('showTutorial2') ?? true;
    });
  }

  saveScore() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      mainPage.scoreBalance > mainPage.highScore
          ? prefs.setInt('score', mainPage.scoreBalance + 1)
          : null;
    });
  }

  scoreBalance() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      mainPage.scoreBalance = prefs.getInt('scoreBalance') ?? 0;
      prefs.setInt('scoreBalance', mainPage.scoreBalance + 1);
    });
  }

  navigator() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mainPage.points == 0) {
        scoreBalance();
        saveScore();
        loadScores();
        if (mainPage.levelUp == materials.level2) {
          if (mainPage.showTutorial2 == true) {
            tutorialAlert();
            showGeneralDialog(
              barrierLabel: "label",
              barrierDismissible: false,
              barrierColor: Colors.black.withOpacity(0.5),
              transitionDuration: const Duration(milliseconds: 200),
              context: context,
              pageBuilder: (context, anim1, anim2) {
                return WillPopScope(
                  onWillPop: () => Future.value(false),
                  child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 30),
                      child: Container(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50.0, vertical: 31),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  mainPage.language
                                      ? "Daha fazla Kutu! İşler Zorlaşıyor!"
                                      : "More boxes, More challenges!",
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: materials.textColor,
                                    decoration: TextDecoration.none,
                                    fontFamily: 'gamefont',
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 31.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(
                                        Icons.priority_high_rounded,
                                        size: 50,
                                        color: materials.textColor,
                                      ),
                                      Image.asset(
                                        'assets/Images/tutorial5.png',
                                        height: 131,
                                      ),
                                      Icon(
                                        Icons.priority_high_rounded,
                                        size: 50,
                                        color: materials.textColor,
                                      ),
                                    ],
                                  ),
                                ),
                                animatedLeft(
                                  widget: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: materials.textColor),
                                      onPressed: () {
                                        tutorial();
                                        tapSound2();
                                        win2();
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const level_3_Stages()));
                                      },
                                      child: Text(
                                          mainPage.language
                                              ? "Devam et"
                                              : "Continue",
                                          style: TextStyle(
                                              color: materials.closedColor,
                                              fontSize: 18,
                                              fontFamily: 'gamefont'))),
                                )
                              ],
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: materials.backgroundColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                );
              },
              transitionBuilder: (context, anim1, anim2, child) {
                return SlideTransition(
                  position:
                      Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
                          .animate(anim1),
                  child: child,
                );
              },
            );
          } else {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => level_3_Stages()));
          }
        } else {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => level_2_Stages()));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: materials.stageTimer), () {
      setState(() {
        if (mainPage.safety != true) {
          materials.fakeBoxColor = materials.closedColor;
          level_2_Stages.boxTimer2 = true;
          mainPage.pickColor1 = materials.closedColor;
          mainPage.pickColor2 = materials.closedColor;
          mainPage.pickColor3 = materials.closedColor;
          mainPage.pickColor4 = materials.closedColor;
          mainPage.pickColor5 = materials.closedColor;
          mainPage.pickColor6 = materials.closedColor;
          mainPage.pickColor7 = materials.closedColor;
        }
      });
    });

    return SafeArea(
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          backgroundColor: materials.backgroundColor,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("-",
                          style: TextStyle(
                            fontSize: 50,
                            color: materials.textColor,
                          )),
                      TweenAnimationBuilder(
                        tween: Tween(begin: 0.0, end: 1.0),
                        duration: Duration(milliseconds: materials.stageTimer),
                        builder: (context, double value, _) => SizedBox(
                            height: 42,
                            width: 42,
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                CircularProgressIndicator(
                                  backgroundColor: materials.backgroundColor,
                                  valueColor:
                                      const AlwaysStoppedAnimation<Color>(
                                          Color(0xFFC4C4C4)),
                                  value: value,
                                ),
                                Center(
                                  child: buildProgress(),
                                )
                              ],
                            )),
                      ),
                      Text("-",
                          style: TextStyle(
                            fontSize: 50,
                            color: materials.textColor,
                          )),
                      Text(
                        mainPage.language
                            ? "BÖLÜM  ${mainPage.scoreBalance + 1}"
                            : "STAGE  ${mainPage.scoreBalance + 1}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 40,
                          color: materials.textColor,
                          fontFamily: 'gamefont',
                        ),
                      ),
                    ],
                  ),
                ),
                /////////////////////////////////////////////////////////////////////////////////////////////
                Padding(
                  padding: const EdgeInsets.only(top: 31.0),
                  child: AbsorbPointer(
                    absorbing: level_2_Stages.boxTimer2 ? false : true,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            widgetList()[random],
                            widgetList()[random2],
                            widgetList()[random3],
                            widgetList()[random4],
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            widgetList()[random5],
                            widgetList()[random6],
                            widgetList()[random7],
                            widgetList()[random8],
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            widgetList()[random9],
                            widgetList()[random10],
                            widgetList()[random11],
                            widgetList()[random12],
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            widgetList()[random13],
                            widgetList()[random14],
                            widgetList()[random15],
                            widgetList()[random16],
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                fadeAnimate(
                  isVisible: level_2_Stages.boxTimer2,
                  widget: SlideTransition(
                    position: _offsetAnimation,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                            mainPage.language
                                ? "Kalan: \n ${mainPage.points}"
                                : "Remaining: \n ${mainPage.points}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 31,
                                fontWeight: FontWeight.bold,
                                color: materials.textColor,
                                fontFamily: "gamefont")),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25, bottom: 12),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              mainPage.sounds = !mainPage.sounds;
                            });
                          },
                          icon: mainPage.sounds
                              ? Icon(
                                  Icons.volume_up_rounded,
                                  color: materials.textColor,
                                  size: 31,
                                )
                              : Icon(
                                  Icons.volume_off_rounded,
                                  color: materials.textColor,
                                  size: 31,
                                ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15.0, bottom: 12),
                        child: Text("Trust Your Mind",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: materials.textColor,
                                fontFamily: "gamefont")),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 2500),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(0.02, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticIn,
  ));
  @override
  void dispose() {
    _controller.dispose();
    _animation.dispose();
    _animation2.dispose();
    super.dispose();
  }

/////////////////////////////////////////////////////////////////////////
  late final AnimationController _animation = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  )..repeat(reverse: true);

  late final AnimationController _animation2 = AnimationController(
    duration: const Duration(milliseconds: 4000),
    vsync: this,
  )..repeat(reverse: true);

  Widget buildProgress() {
    if (level_2_Stages.boxTimer2 == false) {
      return FadeTransition(
        opacity: _animation,
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Icon(
            Icons.hourglass_bottom_rounded,
            color: materials.textColor,
            size: 25,
          ),
        ),
      );
    } else {
      return FadeTransition(
          opacity: _animation2,
          child: const Padding(
              padding: EdgeInsets.all(1.0),
              child: Text(
                "Go!",
                style: TextStyle(color: Colors.white),
              )));
    }
  }

  Widget box1() {
    return animate(
      delay: materials.delayList[0],
      widget: InkWell(
        splashColor: materials.splashColor,
        onTap: mainPage.isClicked7
            ? null
            : () {
                tapSound();
                setState(() {
                  mainPage.pickColor7 = materials.boxColor;
                  mainPage.safety = true;
                  mainPage.points = mainPage.points - 1;
                  navigator();
                  win();
                });
                setState(() {
                  mainPage.isClicked7 = true;
                });
              },
        child: boxes(
          color: mainPage.pickColor7,
        ),
      ),
    );
  }

  Widget box2() {
    return animate(
      delay: materials.delayList[1],
      widget: InkWell(
        splashColor: materials.splashColor,
        onTap: mainPage.isClicked6
            ? null
            : () {
                tapSound();
                setState(() {
                  mainPage.pickColor6 = materials.boxColor;
                  mainPage.safety = true;
                  mainPage.points = mainPage.points - 1;
                  navigator();
                  win();
                });
                setState(() {
                  mainPage.isClicked6 = true;
                });
              },
        child: boxes(
          color: mainPage.pickColor6,
        ),
      ),
    );
  }

  Widget box3() {
    return animate(
      delay: materials.delayList[2],
      widget: InkWell(
        splashColor: materials.splashColor,
        onTap: mainPage.isClicked5
            ? null
            : () {
                tapSound();
                setState(() {
                  mainPage.pickColor5 = materials.boxColor;
                  mainPage.safety = true;
                  mainPage.points = mainPage.points - 1;
                  navigator();
                  win();
                });
                setState(() {
                  mainPage.isClicked5 = true;
                });
              },
        child: boxes(
          color: mainPage.pickColor5,
        ),
      ),
    );
  }

  Widget box4() {
    return animate(
      delay: materials.delayList[3],
      widget: InkWell(
        splashColor: materials.splashColor,
        onTap: mainPage.isClicked4
            ? null
            : () {
                tapSound();
                setState(() {
                  mainPage.pickColor4 = materials.boxColor;
                  mainPage.safety = true;
                  mainPage.points = mainPage.points - 1;
                  navigator();
                  win();
                });
                setState(() {
                  mainPage.isClicked4 = true;
                });
              },
        child: boxes(
          color: mainPage.pickColor4,
        ),
      ),
    );
  }

  Widget box5() {
    return animate(
      delay: materials.delayList[4],
      widget: InkWell(
        splashColor: materials.splashColor,
        onTap: mainPage.isClicked3
            ? null
            : () {
                tapSound();
                setState(() {
                  mainPage.pickColor3 = materials.boxColor;
                  mainPage.safety = true;
                  mainPage.points = mainPage.points - 1;
                  navigator();
                  win();
                });
                setState(() {
                  mainPage.isClicked3 = true;
                });
              },
        child: boxes(
          color: mainPage.pickColor3,
        ),
      ),
    );
  }

  Widget box6() {
    return animate(
      delay: materials.delayList[5],
      widget: InkWell(
        splashColor: materials.splashColor,
        onTap: mainPage.isClicked2
            ? null
            : () {
                tapSound();
                setState(() {
                  mainPage.pickColor2 = materials.boxColor;
                  mainPage.safety = true;
                  mainPage.points = mainPage.points - 1;
                  navigator();
                  win();
                });
                setState(() {
                  mainPage.isClicked2 = true;
                });
              },
        child: boxes(
          color: mainPage.pickColor2,
        ),
      ),
    );
  }

  Widget box7() {
    return animate(
      delay: materials.delayList[6],
      widget: InkWell(
        splashColor: materials.splashColor,
        onTap: mainPage.isClicked1
            ? null
            : () {
                tapSound();
                setState(() {
                  mainPage.pickColor1 = materials.boxColor;
                  mainPage.safety = true;
                  mainPage.points = mainPage.points - 1;
                  navigator();
                  win();
                });
                setState(() {
                  mainPage.isClicked1 = true;
                });
              },
        child: boxes(
          color: mainPage.pickColor1,
        ),
      ),
    );
  }

  Widget box8() {
    return animatedboxes();
  }

  Widget box9() {
    return animatedboxes();
  }

  Widget box10() {
    return animatedboxes();
  }

  Widget box11() {
    return animatedboxes();
  }

  Widget box12() {
    return animatedboxes();
  }

  Widget box13() {
    return animatedFakeBox(
      widget: fakeBox(
        color: materials.fakeBoxColor,
      ),
    );
  }

  Widget box14() {
    return animatedFakeBox(
      widget: fakeBox(
        color: materials.fakeBoxColor,
      ),
    );
  }

  Widget box15() {
    return animatedFakeBox(
      widget: fakeBox(
        color: materials.fakeBoxColor,
      ),
    );
  }

  Widget box16() {
    return animatedFakeBox(
      widget: fakeBox(
        color: materials.fakeBoxColor,
      ),
    );
  }
}
