import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
abstract class AuthBase{
  User get currentUser;
  Stream<User> authStateChanges();
  Future<User> signInAnonymously();
  Future<void> signOut();
  Future<User> signInWithGoogle();
}
class Auth implements AuthBase{
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Stream<User> authStateChanges() => _firebaseAuth.authStateChanges();

  @override
  User get currentUser => _firebaseAuth.currentUser;

  @override
  Future<User> signInAnonymously() async{
    final userCredentials = await _firebaseAuth.signInAnonymously();
    return userCredentials.user;
  }

  @override
  Future<User> signInWithGoogle() async{
    final googleSignIn = GoogleSignIn();
    final googleUser = await googleSignIn.signIn();
    if(googleUser != null){
      final googleAuth = await googleUser.authentication;
      if(googleAuth.idToken != null){
        final userCredentials = await _firebaseAuth.signInWithCredential(GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        ));
        return userCredentials.user;
      } else{
        throw FirebaseAuthException(
        code: 'ERROR_MISSING_GOOGLE_ID_TOKEN',
          message: 'Missing Google ID Token',
        );
      }
    } else{
      throw FirebaseAuthException(
        code: 'ERROR_ABORTED_BY_USER',
        message: 'Sign in ABORTED BY USER',
      );
    }
  }

  @override
  Future<void> signOut() async{
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    await _firebaseAuth.signOut();
  }

}