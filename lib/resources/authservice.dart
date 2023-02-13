import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  signUpUser(String email, String password) async {
    UserCredential cred =await _auth.createUserWithEmailAndPassword(email: email, password: password);
    

  }
}
