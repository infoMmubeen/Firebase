import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'loginPage.dart';

class Siginup extends StatefulWidget {
  const Siginup({super.key});

  @override
  State<Siginup> createState() => _SiginupState();
}

class _SiginupState extends State<Siginup> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  signUp(String email, String password) async {
    if (email == '' && password == '') {
      Get.snackbar('error', "please enter the fields ,email , && password ");
    } else {
      UserCredential? userCredential;
      try {
        userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) {
          Get.snackbar('Well Come', 'well come now login your accoutn');
          Get.to(Loginpage());
        });
      } on FirebaseAuthException catch (ex) {
        return Get.snackbar('error', "${ex.toString()}");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SignUP"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Email TextField
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),

            // Password TextField
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24),

            // Login Button
            ElevatedButton(
              onPressed: () {
                // Handle login logic here
                String emailInsideButton = _emailController.text;
                String passwordInsideButton = _passwordController.text;
                signUp(emailInsideButton, passwordInsideButton);
                // You can add validation or authentication logic here
                print(
                    "Email: $emailInsideButton, Password: $passwordInsideButton");
              },
              child: const Text("SignUP"),
            ),
          ],
        ),
      ),
    );
  }
}
