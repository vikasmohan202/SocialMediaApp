import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uuid/uuid.dart';

class StorageMethods {
  final FirebaseStorage _stroage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //adding image to firebase
  Future<String> uploadImageToStorage(
      String childname, Uint8List file, bool isPost) async {
    Reference ref =
        _stroage.ref().child(childname).child(_auth.currentUser!.uid);
    if (isPost) {
      String id = const Uuid().v1();
      ref = ref.child(id);
    }

    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }
}
