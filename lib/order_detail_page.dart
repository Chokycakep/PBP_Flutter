// lib/pages/order_detail_page.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/order_data_model.dart';

class OrderDetailPage extends StatelessWidget {
  final Orderdata order;

  const OrderDetailPage({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final format = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ');

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Pesanan"),
        backgroundColor: const Color(0xFFA47551),
        foregroundColor: Colors.white,
      ),
      backgroundColor: const Color(0xFFF5E1C0),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Card(
              color: const Color(0xFFFFF8F1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Informasi Pesanan",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color(0xFF4E342E)),
                    ),
                    const SizedBox(height: 10),
                    Text("Nama: ${order.nama}"),
                    Text("Alamat: ${order.alamat}"),
                    Text("Metode Pembayaran: ${order.metode}"),
                    Text("Tanggal: ${order.tanggal.toLocal()}".split(' ')[0]),
                    Text("Status: ${order.status}"),
                    const Divider(),
                    Text(
                      "Total: ${format.format(order.total)}",
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4E342E)),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              color: const Color(0xFFFFF8F1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Rincian Barang",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color(0xFF4E342E)),
                    ),
                    const SizedBox(height: 10),
                    ...order.items.map((item) => Text("- $item")),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Penjual telah dihubungi 📞"),
                    backgroundColor: Color(0xFFA47551),
                  ),
                );
              },
              icon: const Icon(Icons.chat_bubble_outline),
              label: const Text("Hubungi Penjual"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFA47551),
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
