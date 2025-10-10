import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/order_data_model.dart';
import 'order_detail_page.dart';

class OrderHistoryPage extends StatelessWidget {
  // Ubah required menjadi default kosong agar CartPage bisa memanggil tanpa argumen
  final List<Orderdata> history;
  const OrderHistoryPage({super.key, this.history = const []});

  @override
  Widget build(BuildContext context) {
    final format = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ');

    return Scaffold(
      appBar: AppBar(
        title: const Text("Riwayat Pesanan"),
        backgroundColor: const Color(0xFFA47551),
        foregroundColor: Colors.white,
      ),
      backgroundColor: const Color(0xFFF5E1C0),
      body: history.isEmpty
          ? const Center(
              child: Text(
                "Belum ada riwayat pesanan 🍰",
                style: TextStyle(fontSize: 16, color: Color(0xFF4E342E)),
              ),
            )
          : ListView.builder(
              itemCount: history.length,
              itemBuilder: (context, index) {
                final order = history[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: const Icon(Icons.receipt_long,
                        color: Color(0xFFA47551)),
                    title: Text(order.nama),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Alamat: ${order.alamat}"),
                        Text("Metode: ${order.metode}"),
                        Text("Total: ${format.format(order.total)}"),
                        Text(
                          "Tanggal: ${DateFormat('dd/MM/yyyy HH:mm').format(order.tanggal)}",
                        ),
                        Text("Status: ${order.status}"),
                        const SizedBox(height: 4),
                        Text(
                          "Item: ${order.items.join(', ')}",
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrderDetailPage(order: order),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
