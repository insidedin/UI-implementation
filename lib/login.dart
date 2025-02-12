import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tugas2_gpa38/pages/home.dart';
import 'package:tugas2_gpa38/register.dart';
import 'package:tugas2_gpa38/widgets/navigation.dart';
import 'package:tugas2_gpa38/widgets/widget.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;

  // Fungsi login
  void login() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Wajib Diisi Semua!')),
      );
      return;
    }

    try {
      await auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Navigation()), //Navigasi ke halaman Home
      );
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'Terjadi kesalahan. Silakan coba lagi.';
      if (e.code == 'pengguna-tidak-ditemukan') {
        errorMessage = 'Pengguna tidak ditemukan.';
      } else if (e.code == 'password-salah') {
        errorMessage = 'Kata sandi salah.';
      } else if (e.code == 'email-tidak-valid') {
        errorMessage = 'Alamat email tidak valid.';
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Terjadi kesalahan yang tidak terduga. Silakan coba lagi.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/logo-bg.png',
                  height: 150,
                ),
              ),
              SizedBox(height: 40),
              Center(
                child: textView(
                  EdgeInsets.all(0),
                  'Selamat Datang di Aplikasi E-Learning Palcomtech',
                  TextAlign.center,
                  Colors.black,
                  FontWeight.w500,
                  16,
                ),
              ),
              SizedBox(height: 30),
              inputController(emailController, Icon(Icons.email), 'Email'),
              SizedBox(height: 25),
              inputController(passwordController, Icon(Icons.lock), 'Password'),
              SizedBox(height: 30),
              // Tombol login
              Center(
                child: ElevatedButton(
                  onPressed: login, //panggil fungsi login
                  child: textView(
                    EdgeInsets.all(0),
                    'LOGIN',
                    TextAlign.center,
                    Colors.white,
                    FontWeight.w500,
                    16,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 1, 20, 54),
                    padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                  ),
                ),
              ),
              SizedBox(height: 30),
              // Teks belum punya akun
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textView(
                    EdgeInsets.all(0),
                    'Belum Punya Akun?',
                    TextAlign.center,
                    Colors.black,
                    FontWeight.w500,
                    15,
                  ),
                  SizedBox(width: 9),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => Register()),
                      );
                    },
                    child: textView(
                      EdgeInsets.all(0),
                      'Register disini',
                      TextAlign.center,
                      const Color.fromARGB(255, 33, 5, 83),
                      FontWeight.bold,
                      15,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}