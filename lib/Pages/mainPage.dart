import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trust_your_mind/Material/materials.dart';
import 'package:trust_your_mind/Pages/Stages/1-10/level_1_StagesAuto.dart';
import 'package:trust_your_mind/Widgets/arrows.dart';

class mainPage extends StatefulWidget {
  mainPage({Key? key}) : super(key: key);

  static bool isClicked1 = false;
  static bool isClicked2 = false;
  static bool isClicked3 = false;
  static bool isClicked4 = false;
  static bool isClicked5 = false;
  static bool isClicked6 = false;
  static bool isClicked7 = false;
  static bool isClicked8 = false;
  static bool safety = false;

  static Color pickColor1 = materials.boxColor;
  static Color pickColor2 = materials.boxColor;
  static Color pickColor3 = materials.boxColor;
  static Color pickColor4 = materials.boxColor;
  static Color pickColor5 = materials.boxColor;
  static Color pickColor6 = materials.boxColor;
  static Color pickColor7 = materials.boxColor;
  static Color pickColor8 = materials.boxColor;

  static var boxTimer = false;
  static var points = 7;
  static bool beginTimer = true;

  static bool language = true;
  static bool sounds = true;
  static int highScore = 0;
  static int scoreBalance = 0;
  static int levelUp = 0;

  static bool showTutorial = true;
  static bool showTutorial2 = true;
  static bool showTutorial3 = true;

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  final _audioCache = AudioCache(
      prefix: 'assets/Sounds/',
      fixedPlayer: AudioPlayer(mode: PlayerMode.LOW_LATENCY));
  void tapSound() {
    mainPage.sounds == true ? _audioCache.play(materials.tapSound2) : null;
  }

  @override
  void initState() {
    setState(() {
      mainPage.levelUp = 0;
      scoreBalanceReset();
      loadSettings();
      super.initState();
    });
  }

  void loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      mainPage.language = prefs.getBool('language') ?? false;
      mainPage.highScore = prefs.getInt('score') ?? 0;
      mainPage.scoreBalance = prefs.getInt('scoreBalance') ?? 0;
      mainPage.showTutorial = prefs.getBool('showTutorial') ?? true;
      mainPage.showTutorial = prefs.getBool('showTutorial2') ?? true;
      mainPage.showTutorial = prefs.getBool('showTutorial3') ?? true;
    });
  }

  void scoreBalanceReset() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.remove('scoreBalance');
    });
  }

  void turkish() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setBool('language', true);
    });
  }

  void english() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setBool('language', false);
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: materials.backgroundColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 45.0, bottom: 60),
                child: materials.title,
              ),
              SizedBox(
                height: 62,
                width: 160,
                child: ElevatedButton(
                  onPressed: () {
                    tapSound();
                    Future.delayed(const Duration(milliseconds: 40), () {
                      mainPage.sounds == true
                          ? _audioCache.play('winSound.mp3')
                          : null;
                    });
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => level_1_Stages()));
                  },
                  child: Text(
                    mainPage.language ? 'Oyna' : 'Play',
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'gamefont',
                        fontSize: 25),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: materials.textColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 62,
                width: 220,
                child: ElevatedButton(
                  onPressed: () {
                    tapSound();
                    showGeneralDialog(
                      barrierLabel: "label",
                      barrierDismissible: true,
                      barrierColor: Colors.black.withOpacity(0.5),
                      transitionDuration: const Duration(milliseconds: 200),
                      context: context,
                      pageBuilder: (context, anim1, anim2) {
                        return Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 30),
                            child: ScrollConfiguration(
                              behavior: MyBehavior(),
                              child: Container(
                                height: screenSize.height / 1.2,
                                width: screenSize.width / 1.2,
                                child: SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0, vertical: 28),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 15.0),
                                          child: Text(
                                            mainPage.language
                                                ? 'Nasıl Oynanır?'
                                                : 'How To Play?',
                                            style: const TextStyle(
                                                decoration: TextDecoration.none,
                                                color: Colors.black,
                                                fontSize: 26,
                                                fontFamily: "gamefont"),
                                          ),
                                        ),
                                        Text(
                                          mainPage.language
                                              ? 'Oyuna başladığınız zaman ekrana \n(ilk seviye için) 16 tane kutucuk gelecek bir kısmı renkli ve bir kısmı renksiz olacak ve yaklaşık 3 saniye gösterildikten sonra hepsi kapanacak. Renkli kutuların yerlerini aklınızda tutmalısınız. Hepsini doğru açmayı başarırsanız sonraki seviyeye geçebilirsiniz ancak yanlış kutuyu açarsanız oyunu kaybedersiniz. \nUnutmayın! sadece kırmızılar!\n\n Başla dediğinizde neler ile karşılaşacağınızı öğrenmek istiyorsanız aşağı kaydırın!'
                                              : "When you start the game, 16 boxes (for the first level) will appear on the screen, some of which will be colored and some will be colorless, and they will all be closed after being displayed for about 3 seconds. You should keep in mind the locations of the colored boxes. If you manage to open them all correctly, you can proceed to the next level, but if you open the wrong box, you will lose the game. \nRemember! reds only!\n\nScroll down to know what you'll find when you say get started!",
                                          style: const TextStyle(
                                            fontFamily: 'prcfontBold',
                                            decoration: TextDecoration.none,
                                            color: Colors.black,
                                            fontSize: 23,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        arrows(top: 80, bottom: 20),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 50.0),
                                          child: Column(
                                            children: [
                                              Text(
                                                mainPage.language
                                                    ? 'Yeşil oklarla gösterilen kısımlardan kutuların kapanmasına kalan süreyi görebilir, ayrıca kalan kutu sayısını takip edebilirsiniz.'
                                                    : 'You can follow the remaining time until the boxes are closed from the sections indicated by the green arrows, and you can also see the number of boxes remaining.',
                                                style: const TextStyle(
                                                  fontFamily: 'prcfontBold',
                                                  decoration:
                                                      TextDecoration.none,
                                                  color: Colors.black,
                                                  fontSize: 23,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Center(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      12.0),
                                                  child: SizedBox(
                                                      height: 400,
                                                      child: Image.asset(
                                                          "assets/Images/tutorial1.png")),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        arrows(
                                          top: 31,
                                          bottom: 20,
                                        ),
                                        Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(18.0),
                                              child: Text(
                                                mainPage.language
                                                    ? 'Süre bittiğinde tam olarak şöyle gözükecek.'
                                                    : 'This is what it will look like when the time is up.',
                                                style: const TextStyle(
                                                  fontFamily: 'prcfontBold',
                                                  decoration:
                                                      TextDecoration.none,
                                                  color: Colors.black,
                                                  fontSize: 23,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            Center(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(12.0),
                                                child: SizedBox(
                                                    height: 400,
                                                    child: Image.asset(
                                                        "assets/Images/tutorial2.png")),
                                              ),
                                            ),
                                            arrows(top: 70, bottom: 31),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 12.0, bottom: 15),
                                                child: Text(
                                                    mainPage.language
                                                        ? "Tüm kırmızı kutuları açmalısınız."
                                                        : "you must open all the red boxes",
                                                    style: const TextStyle(
                                                      fontFamily: 'prcfontBold',
                                                      decoration:
                                                          TextDecoration.none,
                                                      color: Colors.black,
                                                      fontSize: 23,
                                                    ),
                                                    textAlign:
                                                        TextAlign.center)),
                                            Center(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(12.0),
                                                child: SizedBox(
                                                    height: 400,
                                                    child: Image.asset(
                                                        "assets/Images/tutorial3.png")),
                                              ),
                                            ),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 18.0),
                                                child: Text(
                                                  mainPage.language
                                                      ? 'İyi Oyunlar!'
                                                      : 'Good Luck!',
                                                  style: const TextStyle(
                                                    fontFamily: 'prcfontBold',
                                                    decoration:
                                                        TextDecoration.none,
                                                    color: Colors.black,
                                                    fontSize: 23,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                )),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: materials.textColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      transitionBuilder: (context, anim1, anim2, child) {
                        return SlideTransition(
                          position: Tween(
                                  begin: const Offset(0, 1),
                                  end: const Offset(0, 0))
                              .animate(anim1),
                          child: child,
                        );
                      },
                    );
                  },
                  child: Text(
                    mainPage.language ? 'Nasıl Oynanır?' : 'How To Play?',
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'gamefont',
                        fontSize: 24),
                  ),
                  style: ElevatedButton.styleFrom(primary: materials.textColor),
                ),
              ),
              const Spacer(),
              ToggleButtons(
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Türkçe',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'gamefont',
                          fontSize: 22),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'English',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'gamefont',
                          fontSize: 22),
                    ),
                  ),
                ],
                onPressed: (int index) {
                  tapSound();
                  setState(() {
                    mainPage.language = index == 0 ? true : false;
                    index == 0 ? turkish() : english();
                  });
                },
                isSelected: [
                  mainPage.language ? false : true,
                  mainPage.language ? true : false,
                ],
                selectedColor: materials.textColor,
                fillColor: materials.textColor,
                borderColor: materials.textColor,
                borderWidth: 2,
                selectedBorderColor: materials.textColor,
                disabledColor: materials.textColor,
                disabledBorderColor: materials.textColor,
                focusColor: materials.textColor,
              ),
              const SizedBox(
                height: 31,
              ),
              Text(
                mainPage.language ? 'Rekor' : 'High Score',
                style: TextStyle(
                    color: materials.textColor,
                    fontSize: 25,
                    fontFamily: 'gamefont'),
              ),
              Text(
                "${mainPage.highScore}",
                style: TextStyle(
                    color: materials.textColor,
                    fontSize: 25,
                    fontFamily: 'gamefont'),
              ),
              const SizedBox(
                height: 31,
              )
            ],
          ),
        ),
      ),
    );
  }
}
