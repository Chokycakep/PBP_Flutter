import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("About")),
      backgroundColor: const Color(0xFFF5E1C0),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.coffee, size: 80, color: Color(0xFFA47551)),
              SizedBox(height: 16),
              Text(
                "Caramel Cafe & Bakery",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4E342E)),
              ),
              SizedBox(height: 8),
              Text(
                "Dibuat oleh: Nama Kamu\n\nSebuah demo sederhana aplikasi kafe dengan tema caramel yang hangat.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xFF4E342E)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
