import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_after_slow_fire/home.dart';

import 'loginPage.dart';

class Checkuser extends StatefulWidget {
  const Checkuser({super.key});

  @override
  State<Checkuser> createState() => _CheckuserState();
}

class _CheckuserState extends State<Checkuser> {
  checkuser() {
    final user = FirebaseAuth.instance.currentUser;
    print(user);
    if (user != null) {
      return HomePage(); // Navigate to HomePage if user is logged in
    } else {
      return Loginpage(); // Navigate to LoginPage if no user is logged in
    }
  }

  @override
  Widget build(BuildContext context) {
    return checkuser();
  }
}
