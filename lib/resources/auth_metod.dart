import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagram_clone/resources/stroage_method.dart';
import '../models/user.dart' as model;

class authMethod  {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<model.User> getUserDetails() async {
    try {
      User currentUser = _auth.currentUser!;
      DocumentSnapshot snap =
          await _firestore.collection('users').doc(currentUser.uid).get();
      
      return model.User.fromSnap(snap);
    } catch (err) {
      print(err.toString());
      throw err;
    }
  }

//this is the function to signUp user

  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  }) async {
    String res = "Some error occurred";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty) {
        //register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        print(cred.user!.uid);

        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilepics', file, false);

        model.User user = model.User(
          username: username,
          uid: cred.user!.uid,
          email: email,
          bio: bio,
          followers: [],
          following: [],
          photoUrl: photoUrl,
        );

        //add user to our data
        await _firestore.collection('users').doc(cred.user!.uid).set(
              user.toJson(),
            );

        res = 'success';
        
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

//login in  user
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "error";

    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "success";
        
      } else {
        res = "user needs to enter all the fields";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
