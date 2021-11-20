import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

class UserModel {
  String id;
  String name;
  String email;

  UserModel({this.id, this.name, this.email});

  UserModel.fromDocumentSnapshot({DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot.id;
    name = documentSnapshot["name"];
    email = documentSnapshot["email"];
  }

  UserModel.fromDataSnapshot({DataSnapshot dataSnapshot}) {
    id = dataSnapshot.value["id"];
    name = dataSnapshot.value["name"];
    email = dataSnapshot.value["email"];
  }
}
