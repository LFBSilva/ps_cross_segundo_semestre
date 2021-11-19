import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:ps_cross_2semestre/constants/firebase_constants.dart';
import 'package:ps_cross_2semestre/models/user.dart';
import 'package:ps_cross_2semestre/pages/home.page.dart';

import 'package:ps_cross_2semestre/pages/login.page.dart';
import 'package:ps_cross_2semestre/services/database.dart';

class AuthController extends GetxController {
  static AuthController authInstance = Get.find();
  Rx<User> firebaseUser;

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());

    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User user) {
    if (user != null) {
      // user is logged in
      Get.offAll(() => HomePage());
    } else {
      // user is null as in user is not available or not logged in
      Get.offAll(() => LoginPage());
    }
  }

  void register(String email, String password) async {
    try {
      UserCredential authResult = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      UserModel _user = UserModel(
        id: authResult.user.uid,
        email: authResult.user.email,
        name: authResult.user.displayName,
      );
      await Database().createNewUser(_user);
    } on FirebaseException catch (e) {
      Get.snackbar(
        "Error",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Error",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void signOut() {
    try {
      auth.signOut();
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
