import 'package:chatapp/src/config/config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

void addDataToFireStore(User? user) {
  final firestore = FirebaseFirestore.instance;
  final data = {
    'name': user!.displayName ?? user.email!.split("@")[0],
    'date_time': DateTime.now(),
    'email': user.email,
    "photo_url": user.photoURL,
  };
  firestore.collection(userCollection).doc(user.uid).set(data);
}
