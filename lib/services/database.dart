import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:ps_cross_2semestre/constants/firebase_constants.dart';
import 'package:ps_cross_2semestre/models/sensor.dart';
import 'package:ps_cross_2semestre/models/user.dart';

class Database {
  Future<bool> createNewUser(UserModel user) async {
    try {
      await db.child("users").child(user.id).set({
        "name": user.name,
        "email": user.email,
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<UserModel> getUser(String uid) async {
    try {
      DataSnapshot _doc = await db.child("users").child(uid).once();
      return UserModel.fromDataSnapshot(dataSnapshot: _doc);
    } catch (e) {
      Get.snackbar(
        "Error",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
      rethrow;
    }
  }

  Future<List<SensorModel>> getAllSensors() async {
    try {
      DataSnapshot _doc = await db.child("allSensors").get();
      List<SensorModel> _sensores = [];
      _doc.value.forEach((key, value) {
        _sensores.add(
          SensorModel(
            uid: value["uid"],
            name: value["name"],
            type: value["type"],
            status: value["status"],
            latitude: value["lat"].toDouble(),
            longitude: value["lng"].toDouble(),
          ),
        );
      });
      return _sensores;
    } catch (e) {
      Get.snackbar(
        "Error",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
      rethrow;
    }
  }

  Future<List<SensorModel>> getTemperaturaSensors() async {
    try {
      DataSnapshot _doc = await db.child("temperaturaSensores").get();
      List<SensorModel> _sensores = [];
      _doc.value.forEach((key, value) {
        _sensores.add(
          SensorModel(
            uid: value["uid"],
            name: value["name"],
            type: value["type"],
            status: value["status"],
            latitude: value["lat"].toDouble(),
            longitude: value["lng"].toDouble(),
          ),
        );
      });
      return _sensores;
    } catch (e) {
      Get.snackbar(
        "Error",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
      rethrow;
    }
  }

  Future<List<SensorModel>> getOxigenioSensors() async {
    try {
      DataSnapshot _doc = await db.child("oxigenioSensores").get();
      List<SensorModel> _sensores = [];
      _doc.value.forEach((key, value) {
        _sensores.add(
          SensorModel(
            uid: value["uid"],
            name: value["name"],
            type: value["type"],
            status: value["status"],
            latitude: value["lat"].toDouble(),
            longitude: value["lng"].toDouble(),
          ),
        );
      });
      return _sensores;
    } catch (e) {
      Get.snackbar(
        "Error",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
      rethrow;
    }
  }

  Future<List<SensorModel>> getPhSensors() async {
    try {
      DataSnapshot _doc = await db.child("phSensores").get();
      List<SensorModel> _sensores = [];
      _doc.value.forEach((key, value) {
        _sensores.add(
          SensorModel(
            uid: value["uid"],
            name: value["name"],
            type: value["type"],
            status: value["status"],
            latitude: value["lat"].toDouble(),
            longitude: value["lng"].toDouble(),
          ),
        );
      });
      return _sensores;
    } catch (e) {
      Get.snackbar(
        "Error",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
      rethrow;
    }
  }

  Future<List<SensorModel>> getProfundidadeSensors() async {
    try {
      DataSnapshot _doc = await db.child("profundidadeSensores").get();
      List<SensorModel> _sensores = [];
      _doc.value.forEach((key, value) {
        _sensores.add(
          SensorModel(
            uid: value["uid"],
            name: value["name"],
            type: value["type"],
            status: value["status"],
            latitude: value["lat"].toDouble(),
            longitude: value["lng"].toDouble(),
          ),
        );
      });
      return _sensores;
    } catch (e) {
      Get.snackbar(
        "Error",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
      rethrow;
    }
  }
}
