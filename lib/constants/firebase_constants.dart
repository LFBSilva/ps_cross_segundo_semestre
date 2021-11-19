import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

FirebaseAuth auth = FirebaseAuth.instance;
DatabaseReference db = FirebaseDatabase().reference();
final Future<FirebaseApp> firebaseInitialization = Firebase.initializeApp();
