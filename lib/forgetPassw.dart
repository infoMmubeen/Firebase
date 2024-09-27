import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_after_slow_fire/loginPage.dart';

import 'home.dart';
import 'siginUp.dart';

class Forgetpassw extends StatefulWidget {
  const Forgetpassw({super.key});

  @override
  State<Forgetpassw> createState() => _ForgetpasswState();
}

class _ForgetpasswState extends State<Forgetpassw> {
  final TextEditingController _emailControllerLogin = TextEditingController();

  resetPassword(String email) async {
    if (email == '') {
      Get.snackbar('Field', "please enter required Fielsf ");
    } else {
      try {
        FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        print(
            "firebbbbbbbbbbbbbbbbbbbaaaaaaaaaaaassssseee  ${FirebaseAuth.instance.sendPasswordResetEmail(email: email)}");
      } on FirebaseAuthException catch (ex) {
        return Get.snackbar('error', "${ex.toString()}");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
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
              controller: _emailControllerLogin,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),

            // Password TextField

            // Login Button
            ElevatedButton(
              onPressed: () {
                // Handle login logic here
                String emailInsideButton = _emailControllerLogin.text;

                resetPassword(
                  emailInsideButton,
                );
                // You can add validation or authentication logic here
                print("Emailsssss: $emailInsideButton");
                Get.to(Loginpage());
              },
              child: const Text("Reset"),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
