import 'package:flutter/material.dart';
import '../models/cart_model.dart';
import 'order_history.dart'; // ✅ Import halaman riwayat pesanan

class CheckoutDetail extends StatefulWidget {
  final int totalHarga;

  const CheckoutDetail({super.key, required this.totalHarga});

  @override
  State<CheckoutDetail> createState() => _CheckoutDetailState();
}

class _CheckoutDetailState extends State<CheckoutDetail> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  String metodePembayaran = 'Transfer Bank';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Checkout"),
        backgroundColor: const Color(0xFFA47551),
        foregroundColor: Colors.white,
      ),
      backgroundColor: const Color(0xFFF5E1C0),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Nama Pemesan",
              style: TextStyle(color: Color(0xFF4E342E)),
            ),
            TextField(
              controller: namaController,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Masukkan nama lengkap",
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Alamat Pengiriman",
              style: TextStyle(color: Color(0xFF4E342E)),
            ),
            TextField(
              controller: alamatController,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Masukkan alamat lengkap",
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Metode Pembayaran",
              style: TextStyle(color: Color(0xFF4E342E)),
            ),
            DropdownButton<String>(
              value: metodePembayaran,
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                  value: 'Transfer Bank',
                  child: Text("Transfer Bank"),
                ),
                DropdownMenuItem(
                  value: 'COD (Bayar di Tempat)',
                  child: Text("COD (Bayar di Tempat)"),
                ),
                DropdownMenuItem(
                  value: 'E-Wallet',
                  child: Text("E-Wallet"),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  metodePembayaran = value!;
                });
              },
            ),
            const SizedBox(height: 24),
            Center(
              child: Column(
                children: [
                  Text(
                    "Total Pembayaran: Rp ${widget.totalHarga}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4E342E),
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (namaController.text.isEmpty ||
                          alamatController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                "Harap isi nama dan alamat terlebih dahulu."),
                            backgroundColor: Color(0xFFA47551),
                          ),
                        );
                        return;
                      }

                      // ✅ Simpan pesanan ke riwayat
                      CartModel.addOrder(
                        customerName: namaController.text,
                        address: alamatController.text,
                        paymentMethod: metodePembayaran,
                        total: widget.totalHarga,
                      );

                      // ✅ Kosongkan keranjang setelah checkout
                      CartModel.clearCart();

                      // ✅ Navigasi ke halaman Riwayat Pesanan
                      // dan hapus semua halaman sebelumnya (tidak kembali ke keranjang)
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OrderHistoryPage(),
                        ),
                        (Route<dynamic> route) => false,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFA47551),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 14,
                      ),
                    ),
                    child: const Text(
                      "Pesan Sekarang",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
