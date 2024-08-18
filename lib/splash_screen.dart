import 'package:flutter/material.dart';
import 'package:flutter_firebase/login.dart';
import 'package:lottie/lottie.dart';

class splashscreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return splashscreenstate();
  }
}

class splashscreenstate extends State<splashscreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => loginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Lottie.network(
              "https://lottie.host/442a0d58-82dd-4e98-ac3e-1ec52d860d21/BHEK9lcAlG.json"),
        ),
      ),
    );
  }
}
