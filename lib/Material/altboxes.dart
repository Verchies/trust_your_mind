import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:trust_your_mind/Material/materials.dart';
import 'package:trust_your_mind/Pages/mainPage.dart';

class altBoxes extends StatelessWidget {
  altBoxes({this.color, Key? key}) : super(key: key);

  Color? color;

  @override
  Widget build(BuildContext context) {
    final _audioCache = AudioCache(
        prefix: 'assets/Sounds/',
        fixedPlayer: AudioPlayer(mode: PlayerMode.LOW_LATENCY));

    void gameOver() {
      mainPage.sounds == true ? _audioCache.play(materials.gameOver) : null;
    }

    void tapSound() {
      mainPage.sounds == true ? _audioCache.play(materials.tapSound2) : null;
    }

    return InkWell(
        splashColor: materials.splashColor,
        onTap: () {
          gameOver();
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
                            children: [
                              Text(
                                mainPage.language ? "Oyun Bitti" : "Game Over",
                                style: TextStyle(
                                    fontSize: 30,
                                    color: materials.textColor,
                                    decoration: TextDecoration.none,
                                    fontFamily: 'gamefont'),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: materials.textColor),
                                      onPressed: () {
                                        tapSound();
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    mainPage()));
                                      },
                                      child: Text(
                                          mainPage.language
                                              ? "Yeniden Başlat"
                                              : "Restart",
                                          style: TextStyle(
                                              color: materials.closedColor,
                                              fontSize: 18,
                                              fontFamily: 'gamefont'))),
                                ],
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
        },
        child: Padding(
          padding: const EdgeInsets.all(1.5),
          child: Ink(
            color: Colors.brown[300],
            width: materials.boxSize1,
            height: materials.boxSize1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100), color: color),
              ),
            ),
          ),
        ));
  }
}
