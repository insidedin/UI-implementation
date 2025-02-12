import 'package:flutter/material.dart';
import 'package:tugas2_gpa38/dailyruby/dailyhome.dart';
import 'package:tugas2_gpa38/flyaway/flyhome.dart';
import 'package:tugas2_gpa38/pages/course.dart';
import 'package:tugas2_gpa38/pages/history.dart';
import 'package:tugas2_gpa38/pages/home.dart';
import 'package:tugas2_gpa38/pages/profile.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  //inisialisasi page
  final List<Widget> page = [
    const FlyHome(),
    const Course(),
    const History(),
    const Profile(),

  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        selectedItemColor: const Color.fromARGB(255, 1, 29, 77),
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.amp_stories_sharp), label: 'Course'),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), label: 'Search Course'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded), label: 'Profile')
        ],
      ),
    );
  }
}
