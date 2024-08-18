import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  // Initialize FirebaseAuth instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Signup method that creates a user with an email and password
  Future<User?> SignupMethod(String email, String password) async {
    try {
      // Attempt to create a new user
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Return the created user if successful
      return credential.user;
    } catch (e) {
      // Handle other, non-Firebase-specific errors
      print("Failed to sign up user: $e");
    }
    // Return null if signup fails
    return null;
  }

  Future<User?> SignInMethod(String email, String password) async {
    try {
      // Attempt to create a new user
      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Return the created user if successful
      return credential.user;
    } catch (e) {
      // Handle other, non-Firebase-specific errors
      print("Failed to sign in user: $e");
    }
    // Return null if signup fails
    return null;
  }
}
