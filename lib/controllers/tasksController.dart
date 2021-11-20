import 'package:get/get.dart';
import 'package:ps_cross_2semestre/controllers/authController.dart';
import 'package:ps_cross_2semestre/pages/Widgets/projects_tab/projects.tab.dart';
import 'package:ps_cross_2semestre/pages/Widgets/search_tab/search.tab.dart';
import 'package:ps_cross_2semestre/pages/Widgets/tasks_tab/tasks.tab.dart';

class HomePageController extends GetxController {
  final currentIndex = 0.obs;
  setSelectedIndex(int index) {
    if (index == 0) {
      AuthController.authInstance.signOut();
    } else if (index == 1) {
      Get.to(ProjectsTab());
    } else if (index == 2) {
      Get.to(SearchTab());
    } else if (index == 3) {
      Get.to(TasksTab());
    }
    currentIndex.value = index;
  }
}
