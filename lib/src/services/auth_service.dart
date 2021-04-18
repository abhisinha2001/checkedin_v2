import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  Future<UserCredential> signInWithGoogle(AuthCredential credential) {
    return _auth.signInWithCredential(credential);
  }

  Future<void> logout() {
    return _auth.signOut();
  }

  Stream<User> get currentUser => _auth.authStateChanges();
}
