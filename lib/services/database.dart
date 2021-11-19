import 'package:firebase_database/firebase_database.dart';
import 'package:ps_cross_2semestre/constants/firebase_constants.dart';
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
      print(e);
      rethrow;
    }
  }

  /*Future<void> addTodo(String content, String uid) async {
    try {
      await _firestore
          .collection("users")
          .document(uid)
          .collection("todos")
          .add({
        'dateCreated': Timestamp.now(),
        'content': content,
        'done': false,
      });
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Stream<List<TodoModel>> todoStream(String uid) {
    return _firestore
        .collection("users")
        .document(uid)
        .collection("todos")
        .orderBy("dateCreated", descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<TodoModel> retVal = List();
      query.documents.forEach((element) {
        retVal.add(TodoModel.fromDocumentSnapshot(element));
      });
      return retVal;
    });
  }

  Future<void> updateTodo(bool newValue, String uid, String todoId) async {
    try {
      _firestore
          .collection("users")
          .document(uid)
          .collection("todos")
          .document(todoId)
          .updateData({"done": newValue});
    } catch (e) {
      print(e);
      rethrow;
    }
  }*/
}
