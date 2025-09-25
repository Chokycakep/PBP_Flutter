import 'package:flutter/material.dart';
import 'models/cake_model.dart';

class DetailPage extends StatelessWidget {
  final CakeModel cake;

  const DetailPage({super.key, required this.cake});

  // Data produk dipusatkan di sini
  static final List<CakeModel> cakes = [
    CakeModel(
      name: "Produk Kue 1",
      price: 25000,
      description: "Kue lezat dengan topping cokelat 🍫",
    ),
    CakeModel(
      name: "Produk Kue 2",
      price: 30000,
      description: "Kue vanila lembut dengan krim vanilla 🍦",
    ),
    CakeModel(
      name: "Produk Kue 3",
      price: 28000,
      description: "Kue red velvet premium dengan cream cheese ❤️",
    ),
    CakeModel(
      name: "Produk Kue 4",
      price: 35000,
      description: "Kue keju meleleh dengan tekstur lembut 🧀",
    ),
    CakeModel(
      name: "Produk Kue 5",
      price: 27000,
      description: "Kue kopi wangi khas Caramel Cafe ☕",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(cake.name)),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cake.name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text("Harga: Rp ${cake.price}"),
            const SizedBox(height: 10),
            Text("Deskripsi: ${cake.description}"),
          ],
        ),
      ),
    );
  }
}
