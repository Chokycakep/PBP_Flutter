import 'package:flutter/material.dart';
import '../models/cake_model.dart';
import '../models/cart_model.dart';

/// Halaman detail satu kue
class CakeDetailView extends StatelessWidget {
  final CakeModel cake;
  const CakeDetailView({super.key, required this.cake});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5E1C0),
      appBar: AppBar(
        title: Text(cake.name),
        backgroundColor: const Color(0xFFA47551),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cake.name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4E342E),
              ),
            ),
            const SizedBox(height: 10),
            Text("Harga: Rp ${cake.price}",
                style: const TextStyle(color: Color(0xFF4E342E))),
            const SizedBox(height: 10),
            Text("Deskripsi: ${cake.description}",
                style: const TextStyle(color: Color(0xFF4E342E))),
            const Spacer(),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  CartModel.addToCart(cake);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("${cake.name} ditambahkan ke keranjang 🛒"),
                      backgroundColor: const Color(0xFFA47551),
                    ),
                  );
                },
                icon: const Icon(Icons.add_shopping_cart),
                label: const Text("Tambah ke Keranjang"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFA47551),
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
