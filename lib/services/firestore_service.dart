//TODO save user data {name and uid} na collection 'gobarber_users'
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gobarber/models/user_model.dart';
import 'package:logger/logger.dart';

class FirestoreService {
  final FirebaseFirestore _firestore;
  FirestoreService(this._firestore);
  String collectionName = "gobarber_users";
  Logger logger = Logger();
  Future<void> saveCurrentUser(
      {@required String name, @required User currentUser}) async {
    try {
      _firestore.collection(collectionName).doc(currentUser.uid).set({
        'name': name,
        'email': currentUser.email,
        'uid': currentUser.uid
      }).then((value) {
        logger.i('Usuário salvo no Firestore');
      });
    } on FirebaseException catch (e) {
      debugPrint('Exception ${e.message} ocurred');
    }
  }

  Future<UserModel> getUserFromFirebase(String uid) async {
    UserModel user;
    try {
      _firestore
          .collection(collectionName)
          .where('uid', isEqualTo: uid)
          .limit(1)
          .get()
          .then((QuerySnapshot snapshot) {
        final docSnapshots = snapshot.docs;
        docSnapshots.forEach((element) {
          user = UserModel.fromMap(element.data());
        });
      });
      return user;
    } on FirebaseException catch (e) {
      logger.d('Exception ${e.message} ocurred on fetch userFromFirebase');
      return null;
    }
  }

  Future<void> updateUserData(
      {String name, String email, String userId}) async {
    try {
      _firestore
          .collection(collectionName)
          .where('uid', isEqualTo: userId)
          .get()
          .then((QuerySnapshot querySnapshot) {
        logger.i(querySnapshot);
      });
    } on FirebaseException catch (e) {
      logger.e(e.message);
    }
  }
}
