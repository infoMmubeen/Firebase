import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'OTPscreen.dart';

class PhoneAuth extends StatefulWidget {
  PhoneAuth({
    super.key,
  });

  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Auth'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: phoneController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: 'Enter Phone Number', border: OutlineInputBorder()),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.verifyPhoneNumber(
                  verificationCompleted: (PhoneAuthCredential credential) {},
                  verificationFailed: (FirebaseAuthException ex) {},
                  codeSent: (String verification, int? resendtoken) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Otpscreen(
                                  verification: verification,
                                )));
                  },
                  codeAutoRetrievalTimeout: (String verification) {},
                  phoneNumber: phoneController.text.toString(),
                );
              },
              child: Text('Verify')),
        ],
      ),
    );
  }
}
