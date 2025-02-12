import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tugas2_gpa38/login.dart';
import 'package:tugas2_gpa38/widgets/widget.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;

  // Fungsi register
  void register() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Wajib Diisi Semua!')),
      );
      return;
    }

    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      if (userCredential.user != null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Login()),
        );
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'Terjadi kesalahan. Silakan coba lagi.';
      if (e.code == 'password-lemah') {
        errorMessage = 'Password terlalu lemah.';
      } else if (e.code == 'email-sudah-terdaftar') {
        errorMessage = 'Akun dengan email tersebut sudah terdaftar.';
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
                  'Daftar Akun E-Learning Palcomtech',
                  TextAlign.center,
                  Colors.black,
                  FontWeight.w500,
                  16,
                ),
              ),
              SizedBox(height: 30),
              inputController(emailController, Icon(Icons.email), 'Email'),
              SizedBox(height: 25),
              inputController(usernameController, Icon(Icons.person), 'Username'),
              SizedBox(height: 25),
              inputController(passwordController, Icon(Icons.lock), 'Password'),
              SizedBox(height: 30),
              // Tombol register
              Center(
                child: ElevatedButton(
                  onPressed: register,
                  child: textView(
                    EdgeInsets.all(0),
                    'REGISTER',
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
                    'Sudah Punya Akun?',
                    TextAlign.center,
                    Colors.black,
                    FontWeight.w500,
                    15,
                  ),
                  SizedBox(width: 9),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    child: textView(
                      EdgeInsets.all(0),
                      'Login disini',
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