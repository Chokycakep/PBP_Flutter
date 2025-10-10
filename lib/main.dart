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
        useMaterial3: true, // Aktifkan Material 3
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFA47551), // Warna karamel utama
          primary: const Color(0xFFA47551),
          secondary: const Color(0xFFD7BFAE),
          surface: const Color(0xFFF5E1C0),
          onPrimary: Colors.white,
          onSurface: const Color(0xFF4E342E),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF5E1C0),

        // AppBar
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFA47551),
          foregroundColor: Colors.white,
          centerTitle: false,
          elevation: 2,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),

        // Tombol
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: const WidgetStatePropertyAll(Color(0xFFA47551)),
            foregroundColor: const WidgetStatePropertyAll(Colors.white),
            padding: const WidgetStatePropertyAll(
              EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),

        // TextField
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFFFFF8F1),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFFA47551), width: 2),
          ),
          labelStyle: const TextStyle(color: Color(0xFF4E342E)),
        ),

        // Tema teks umum
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Color(0xFF4E342E),
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: TextStyle(color: Color(0xFF4E342E)),
          bodySmall: TextStyle(color: Color(0xFF4E342E)),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
