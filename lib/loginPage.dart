import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'forgetPassw.dart';
import 'home.dart';
import 'siginUp.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final TextEditingController _emailControllerLogin = TextEditingController();
  final TextEditingController _passwordControllerLogin =
      TextEditingController();
  Login(String email, String password) async {
    if (email == '' && password == '') {
      Get.snackbar('Field', "please enter required Fielsf ");
    } else {
      UserCredential? userCredential;
      try {
        userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password)
            .then((Value) {
          Get.to((HomePage()));
          print(
              "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa $userCredential");
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
            TextField(
              controller: _passwordControllerLogin,
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
                String emailInsideButton = _emailControllerLogin.text;
                String passwordInsideButton = _passwordControllerLogin.text;
                Login(emailInsideButton, passwordInsideButton);
                // You can add validation or authentication logic here
                print(
                    "Emailsssss: $emailInsideButton, Password: $passwordInsideButton");
              },
              child: const Text("Login"),
            ),
            SizedBox(
              height: 20,
            ),
            Text("if you don't have any  accoutn"),
            ElevatedButton(
                onPressed: () {
                  Get.to(Siginup());
                },
                child: Text('click here ')),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.to(Forgetpassw());
                },
                child: Text('Forget Password '))
          ],
        ),
      ),
    );
  }
}
