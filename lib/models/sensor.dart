import 'package:ps_cross_2semestre/models/event.dart';

class SensorModel {
  String uid;
  String name;
  String type;
  String status;
  double latitude;
  double longitude;
  List<EventModel> events = [];

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
