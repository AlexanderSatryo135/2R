import 'package:flutter/material.dart';
// PENTING: Import halaman awal (Splash Screen)
import 'screens/splash_screen.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Strava KW', // Bisa diganti nama apps Mas
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF3F3F3),
      ),
      home: const SplashScreen(), // Panggil file splash_screen.dart
    );
  }
}