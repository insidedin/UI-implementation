import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tugas2_gpa38/splashscreen.dart';
import 'package:tugas2_gpa38/widgets/navigation.dart'; // Ensure this import is correct

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCUQlDcsAKey5FAgDrhXBGTYKRzUXx9TuU",
      authDomain: "auth-tugas2-83e77.firebaseapp.com",
      projectId: "auth-tugas2-83e77",
      storageBucket: "auth-tugas2-83e77.firebasestorage.app",
      messagingSenderId: "149430163410",
      appId: "1:149430163410:web:e42d337a7da3fcbfa79a0b",
    ),
  );
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
        '/': (context) => SplashScreen(), // Ensure Navigation is implemented
      },
    );
  }
}