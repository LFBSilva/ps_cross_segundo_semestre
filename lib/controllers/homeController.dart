import 'package:get/get.dart';
import 'package:ps_cross_2semestre/controllers/authController.dart';

class HomePageController extends GetxController {
  final currentIndex = 0.obs;
  setSelectedIndex(int index) {
    if (index == 0) {
      AuthController.authInstance.signOut();
    }
    currentIndex.value = index;
  }
}
