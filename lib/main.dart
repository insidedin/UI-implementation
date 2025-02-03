import 'package:flutter/material.dart';
import 'package:tugas2_gpa38/dailyruby/dailyhome.dart';
import 'package:tugas2_gpa38/flyaway/flyhome.dart';
import 'package:tugas2_gpa38/mechanic/carehome.dart';
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
        '/': (context)=> FlyHome(),
        // '/login': (context)=> Login(),
        // '/register': (context)=> Register(),
        // '/navigation': (context)=> Navigation(),
        // '/home': (context)=> Home(),
      },
    );
  }
}
