import 'package:trust_your_mind/Pages/mainPage.dart';

void holdPointsUp() {
  Future.delayed(const Duration(milliseconds: 1000), () {
    if (mainPage.safety == false) {
      mainPage.points = 8;
    }
  });
}
