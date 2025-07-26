import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class FirebaseServices {
  Future<bool> firebaseAuthenticationSignin(
    TextEditingController emailController,
    TextEditingController passwordController,
  ) async {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
    return credential.user != null;
  }

  Future<void> firebaseAuthenticationRegister(
    TextEditingController registerEmailController,
    TextEditingController registerPasswordController,
  ) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: registerEmailController.text.trim(),
      password: registerPasswordController.text.trim(),
    );
  }
}
