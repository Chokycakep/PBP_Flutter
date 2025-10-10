import 'package:flutter/material.dart';
import '../models/cake_model.dart';
import '../models/cart_model.dart';
import 'cake_detail_view.dart';
import 'cart_page.dart';

/// Halaman utama daftar kue
class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  static final List<CakeModel> cakes = [
    CakeModel(
      name: "Kue Cokelat Lumer",
      price: 25000,
      description: "Kue cokelat dengan tekstur lembut dan lumer di mulut 🍫",
    ),
    CakeModel(
      name: "Kue Keju Spesial",
      price: 30000,
      description: "Kue keju lembut dengan rasa manis gurih khas 🧀",
    ),
    CakeModel(
      name: "Kue Red Velvet",
      price: 28000,
      description: "Kue red velvet klasik dengan cream cheese lezat ❤️",
    ),
    CakeModel(
      name: "Kue Kopi Caramel",
      price: 27000,
      description: "Kue aroma kopi dengan sentuhan caramel nikmat ☕",
    ),
  ];

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  void _addToCart(CakeModel cake) {
    setState(() {
      CartModel.addToCart(cake);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("${cake.name} ditambahkan ke keranjang 🛒"),
        backgroundColor: const Color(0xFFA47551),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5E1C0),
      appBar: AppBar(
        title: const Text("Daftar Kue"),
        backgroundColor: const Color(0xFFA47551),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartPage()),
              ).then((_) => setState(() {}));
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: DetailPage.cakes.length,
        itemBuilder: (context, index) {
          final cake = DetailPage.cakes[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: const Icon(Icons.cake, color: Color(0xFFA47551)),
              title: Text(cake.name),
              subtitle: Text("Rp ${cake.price}"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CakeDetailView(cake: cake),
                  ),
                );
              },
              trailing: ElevatedButton(
                onPressed: () => _addToCart(cake),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFA47551),
                  foregroundColor: Colors.white,
                ),
                child: const Text("Tambah"),
              ),
            ),
          );
        },
      ),
    );
  }
}
