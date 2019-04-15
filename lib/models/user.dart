import 'package:firebase_auth/firebase_auth.dart';

class User {
  bool isLoading;
  FirebaseUser userData;
  User({
    this.isLoading = false,
    this.userData,
  });
}
