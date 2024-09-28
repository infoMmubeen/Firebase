import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'phone_auth.dart';
import 'showData.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBwpURKquFwTcSW4ZguzXa3TeQDS_K3zlU",
          authDomain: "justfirebase-ce2a6.firebaseapp.com",
          projectId: "justfirebase-ce2a6",
          storageBucket: "justfirebase-ce2a6.appspot.com",
          messagingSenderId: "479447633518",
          appId: "1:479447633518:web:10d1e204ebb4aa6b97607f",
          measurementId: "G-NFBQ16ZGCJ"),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Showdata(),
    );
  }
}
