import 'dart:ffi';

import 'package:ps_cross_2semestre/models/event.dart';
import 'package:ps_cross_2semestre/models/status.dart';
import 'package:ps_cross_2semestre/models/type.dart';

class SensorModel {
  String uid;
  String name;
  TypeSensor type;
  StatusSensor status;
  Double latitude;
  Double longitude;
  List<Event> events = [];

  SensorModel({
    this.uid,
    this.name,
    this.type,
    this.status,
    this.latitude,
    this.longitude,
    this.events,
  });
}
