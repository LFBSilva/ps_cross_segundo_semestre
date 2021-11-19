import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'constants/firebase_constants.dart';
import 'controllers/authController.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  firebaseInitialization.then((value) {
    Get.put(AuthController());
  });

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'PS-CrossPlataform-2Semestre',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
