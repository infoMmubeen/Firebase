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
    if (user != null) {
      return HomePage(); // Navigate to HomePage if user is logged in
    } else {
      return Loginpage(); // Navigate to LoginPage if no user is logged in
    }
  }

  @override
  Widget build(BuildContext context) {
    return checkuser();
    // return FutureBuilder<Widget>(
    //   future: checkuser(),
    //   builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
    //     // Checking if the future has data
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       // Show a loading spinner while waiting
    //       return const Scaffold(
    //         body: Center(
    //           child: CircularProgressIndicator(),
    //         ),
    //       );
    //     } else if (snapshot.hasData) {
    //       // Show the determined page when the future is done
    //       return snapshot.data!;
    //     } else {
    //       // Handle errors or unexpected nulls
    //       return Scaffold(
    //         body: Center(
    //           child: Text('Error checking user status'),
    //         ),
    //       );
  }
}
