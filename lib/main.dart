import 'package:flutter/material.dart';
import 'splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Caramel Cafe & Bakery',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFFE6D3), // cream
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFA47551), // coklat susu
          foregroundColor: Colors.white,
        ),
      ),
      home: const SplashScreen(), // hanya panggil splash
    );
  }
}
