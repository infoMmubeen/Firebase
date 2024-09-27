import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  lck() {
    Get.snackbar("Home", "weel come to home screen");
  }

  @override
  Widget build(BuildContext context) {
    lck();
    return Scaffold(
      appBar: AppBar(
        title: Text("home Page"),
      ),
    );
  }
}
