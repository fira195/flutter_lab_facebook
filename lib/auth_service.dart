// import 'package:firebase_auth/firebase_auth.dart';

// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   // LOGIN
//   Future<User?> login(String email, String password) async {
//     final result = await _auth.signInWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
//     return result.user;
//   }

//   // REGISTER
//   Future<User?> register(String email, String password) async {
//     final result = await _auth.createUserWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
//     return result.user;
//   }

//   // LOGOUT
//   Future<void> logout() async {
//     await _auth.signOut();
//   }

//   // CURRENT USER
//   User? get currentUser => _auth.currentUser;
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // LOGIN
  Future<User?> login(String email, String password) async {
    final result = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return result.user;
  }

  // REGISTER
  Future<User?> register(String email, String password) async {
    final result = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return result.user;
  }

  // LOGOUT
  Future<void> logout() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }

  // CURRENT USER
  User? get currentUser => _auth.currentUser;

  // GOOGLE SIGN-IN
 

  Future<User?> signInWithGoogle() async {
    try {
      print("Starting Google Sign-In...");

      // Trigger the Google Sign-In flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        print("Google Sign-In cancelled by user.");
        return null; // user canceled
      }
      print("Google user selected: ${googleUser.email}");

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      print("Google access token: ${googleAuth.accessToken}");
      print("Google ID token: ${googleAuth.idToken}");

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the Google credential
      final userCredential = await _auth.signInWithCredential(credential);

      print("Firebase sign-in successful! User: ${userCredential.user?.email}");

      return userCredential.user;
    } catch (e, stacktrace) {
      print("Error during Google Sign-In: $e");
      print(stacktrace);
      rethrow; // pass the error to caller for UI feedback
    }
  }

}
