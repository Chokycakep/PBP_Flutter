import 'package:flutter/material.dart';
import '../models/cart_model.dart';
import 'home.dart'; // pastikan sudah ada file ini

class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final orders = CartModel.orderHistory;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Riwayat Pesanan"),
        backgroundColor: const Color(0xFFA47551),
        foregroundColor: Colors.white,
      ),
      backgroundColor: const Color(0xFFF5E1C0),
      body: orders.isEmpty
          ? const Center(
              child: Text(
                "Belum ada riwayat pesanan ☕",
                style: TextStyle(color: Color(0xFF4E342E), fontSize: 16),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: const Icon(Icons.receipt_long,
                        color: Color(0xFFA47551)),
                    title: Text(
                      "Pesanan oleh: ${order.customerName}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4E342E),
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text("Alamat: ${order.address}"),
                        Text("Metode: ${order.paymentMethod}"),
                        Text("Total: Rp ${order.total}"),
                        const SizedBox(height: 6),
                        const Text(
                          "Item:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        ...order.items.map((item) => Text("- $item")).toList(),
                      ],
                    ),
                  ),
                );
              },
            ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton.icon(
          onPressed: () {
            // ✅ hanya tambahkan userName agar tidak error
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(userName: "Pengguna"),
              ),
              (Route<dynamic> route) => false,
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFA47551),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
          icon: const Icon(Icons.home),
          label: const Text("Kembali ke Menu Utama"),
        ),
      ),
    );
  }
}
