import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tugas2_gpa38/login.dart';
import 'package:tugas2_gpa38/widgets/widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => Login()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 1, 20, 54),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset('assets/logo-bg.png', width: 200, height: 200),
          ),
          Center(
            child: textView(
              EdgeInsets.only(top: 20, left: 30),
                  'Aplikasi E-Learning Palcomtech',
                  TextAlign.center,
                  Colors.white,
                  FontWeight.w500,
                  20
            ),
          )
        ],
      ),
    );
  }
}
