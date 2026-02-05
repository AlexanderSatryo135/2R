import 'package:flutter/material.dart';
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
      title: 'Strava KW',
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFFF3F3F3)),
      home: const SplashScreen(),
    );
  }
}
