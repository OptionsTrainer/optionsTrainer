import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authentication_provider.g.dart';

@riverpod
class AuthenticationProvider extends _$AuthenticationProvider {
  late FirebaseAuth _auth;

  @override
  bool build() {
    _auth = FirebaseAuth.instance;
    return false;
  }

  //sign-up
  Future<User?> signUp(String name, String email, String password) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Update displayName in Firebase Auth
      await result.user?.updateDisplayName(name);

      // Optional: Store user info in FireStore
     /* await FirebaseFirestore.instance
          .collection('users')
          .doc(result.user?.uid)
          .set({
        'uid': result.user?.uid,
        'email': email,
        'name': name,
        'createdAt': FieldValue.serverTimestamp(),
      });*/

      return result.user;
    } catch (e) {
      return null;
    }
  }

  //sign-in
  Future<User?> signIn(String email, String password) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } catch (e) {
      return null;
    }
  }


  //forgot password send reset mail link
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      return;
    }
  }

  //signOut
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
