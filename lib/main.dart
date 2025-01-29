import 'package:flutter/material.dart';
import 'package:tugas2_gpa38/pages/home.dart';
import 'package:tugas2_gpa38/login.dart';
import 'package:tugas2_gpa38/register.dart';
import 'package:tugas2_gpa38/splashscreen.dart';
import 'package:tugas2_gpa38/widgets/navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context)=> Navigation(),
        // '/login': (context)=> Login(),
        // '/register': (context)=> Register(),
        // '/home': (context)=> Home(),
      },
    );
  }
}
