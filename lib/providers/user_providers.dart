import 'package:flutter/material.dart';
import 'package:instagram_clone/resources/auth_metod.dart';
import '../models/user.dart';

class UserProviders with ChangeNotifier {
  User? _user;
  final authMethod _authMethods = authMethod();
  User? get getUser => _user;
  Future<void> refreshUser() async {
    try {
      User user = await _authMethods.getUserDetails();
      _user = user;
      notifyListeners();
    } catch (err) {
      print(err.toString());
    }
    //
  }
}
//
