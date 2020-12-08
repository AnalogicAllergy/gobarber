import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;
  AuthenticationService(this._firebaseAuth);

  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<String> signIn({String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Signed in successfully";
    } on FirebaseAuthException catch (firebaseAuthException) {
      return firebaseAuthException.message;
    }
  }

  Future<String> signUp({String email, String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Signed up successfully";
    } on FirebaseAuthException catch (firebaseAuthException) {
      return firebaseAuthException.message;
    }
  }

  User getCurrentUser() {
    final user = _firebaseAuth.currentUser;

    return user;
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
