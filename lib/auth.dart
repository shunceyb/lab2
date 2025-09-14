import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class AuthService {
  static final _auth = FirebaseAuth.instance;
  static final _googleSignIn = kIsWeb
      ? GoogleSignIn(
          scopes: ['email', 'profile'],
          clientId:
              '444538853268-ldoq24j10cdd1cj9uvatnsefds30aqi3.apps.googleusercontent.com',
        )
      : GoogleSignIn(
          scopes: ['email', 'profile'],
          serverClientId:
              '444538853268-ldoq24j10cdd1cj9uvatnsefds30aqi3.apps.googleusercontent.com',
        );

  /// Get current user
  static User? getCurrentUser() => _auth.currentUser;

  /// Check if user is signed in
  static bool isSignedIn() => _auth.currentUser != null;

  /// Listen to auth state changes
  static Stream<User?> get authStateChanges => _auth.authStateChanges();

  /// Sign up with email and password
  static Future<UserCredential?> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String fullName,
  }) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await result.user?.updateDisplayName(fullName);
      await result.user?.reload();
      await _saveLoginState(true);
      return result;
    } on FirebaseAuthException catch (e) {
      throw _getAuthException(e);
    }
  }

  /// Sign in with email and password
  static Future<UserCredential?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _saveLoginState(true);
      return result;
    } on FirebaseAuthException catch (e) {
      throw _getAuthException(e);
    }
  }

  /// Sign in with Google
  static Future<UserCredential?> signInWithGoogle() async {
    try {
      await _googleSignIn.signOut();
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) throw Exception('Google sign in was cancelled');
      final googleAuth = await googleUser.authentication;
      if (googleAuth.accessToken == null || googleAuth.idToken == null) {
        throw Exception('Failed to get Google authentication tokens');
      }
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final result = await _auth.signInWithCredential(credential);
      await _saveLoginState(true);
      return result;
    } on FirebaseAuthException catch (e) {
      throw _getAuthException(e);
    } catch (e) {
      throw Exception('Google sign in failed: $e');
    }
  }

  /// Sign out
  static Future<void> signOut() async {
    try {
      await _auth.signOut();
      await _googleSignIn.signOut();
      await _saveLoginState(false);
    } catch (e) {
      throw Exception('Sign out failed: $e');
    }
  }

  /// Reset password
  static Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw _getAuthException(e);
    }
  }

  /// Save login state to SharedPreferences
  static Future<void> _saveLoginState(bool isLoggedIn) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_logged_in', isLoggedIn);
  }

  /// Get user-friendly error messages
  static String _getAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return 'No user found with this email.';
      case 'wrong-password':
        return 'Incorrect password.';
      case 'email-already-in-use':
        return 'Email already in use.';
      case 'weak-password':
        return 'Password too weak.';
      case 'invalid-email':
        return 'Invalid email format.';
      case 'user-disabled':
        return 'Account disabled.';
      case 'too-many-requests':
        return 'Too many attempts. Try later.';
      case 'operation-not-allowed':
        return 'Sign-in method not allowed.';
      case 'account-exists-with-different-credential':
        return 'Account exists with different credentials.';
      case 'invalid-credential':
        return 'Invalid or expired credential.';
      case 'user-cancelled':
        return 'Sign in cancelled.';
      default:
        return e.message ?? 'Authentication error.';
    }
  }
}
