import 'package:trust_your_mind/Pages/mainPage.dart';

void holdPoints() {
  Future.delayed(const Duration(milliseconds: 1000), () {
    if (mainPage.safety == false) {
      mainPage.points = 7;
    }
  });
}
