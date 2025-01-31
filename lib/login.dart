import 'package:flutter/material.dart';
import 'package:tugas2_gpa38/register.dart';
import 'package:tugas2_gpa38/widgets/navigation.dart';
import 'package:tugas2_gpa38/widgets/widget.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController UsernameController = TextEditingController();
  final TextEditingController PasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Image.asset(
                    'assets/logo-bg.png',
                    height: 150,
                  ),
                ),
              ),
              SizedBox(height: 40),
              Center(
                child: textView(
                    EdgeInsets.only(top: 20, left: 30),
                    'Selamat Datang di Aplikasi E-Learning Palcomtech',
                    TextAlign.center,
                    Colors.black,
                    FontWeight.w500,
                    16),
              ),
              SizedBox(height: 20),
              inputController(
                  UsernameController, Icon(Icons.person_2_rounded), 'Username'),
              SizedBox(height: 20),
              inputController(PasswordController, Icon(Icons.lock), 'Password'),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) =>Navigation()));
                  },
                  child: textView(EdgeInsets.all(0), 'LOGIN', TextAlign.center,
                      Colors.white, FontWeight.w400, 16),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 1, 20, 54),
                    padding: EdgeInsets.symmetric(
                        horizontal: 100, vertical: 20), // Padding tombol
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Radius tombol
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textView(
                    EdgeInsets.only(top: 20),
                    'Belum Punya Akun?',
                    TextAlign.center,
                    Colors.black,
                    FontWeight.w500,
                    16,
                  ),
                  SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => Register()));
                    },
                    child: textView(
                      EdgeInsets.only(top: 20),
                      'Daftar Disini',
                      TextAlign.center,
                      Color.fromARGB(255, 7, 64, 161),
                      FontWeight.w500,
                      16,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
