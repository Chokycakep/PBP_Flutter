import 'package:flutter/material.dart';
import '../models/cart_model.dart';
import 'package:intl/intl.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _phoneController = TextEditingController();
  String? metodePembayaran = "COD";

  @override
  Widget build(BuildContext context) {
    final cart = CartModel.cartItems;
    final totalHarga = CartModel.totalPrice;
    final format = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ');

    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
        backgroundColor: const Color(0xFFA47551),
        foregroundColor: Colors.white,
      ),
      backgroundColor: const Color(0xFFF5E1C0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Data Pembeli",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: "Nama Lengkap",
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.isEmpty ? "Nama harus diisi" : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: "Nomor Telepon",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) =>
                    value!.isEmpty ? "Nomor telepon harus diisi" : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(
                  labelText: "Alamat Pengiriman",
                  border: OutlineInputBorder(),
                ),
                maxLines: 2,
                validator: (value) =>
                    value!.isEmpty ? "Alamat harus diisi" : null,
              ),
              const SizedBox(height: 20),
              const Text(
                "Metode Pembayaran",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              RadioListTile(
                value: "COD",
                groupValue: metodePembayaran,
                title: const Text("Bayar di Tempat (COD)"),
                onChanged: (value) {
                  setState(() {
                    metodePembayaran = value.toString();
                  });
                },
              ),
              RadioListTile(
                value: "Transfer Bank",
                groupValue: metodePembayaran,
                title: const Text("Transfer Bank"),
                onChanged: (value) {
                  setState(() {
                    metodePembayaran = value.toString();
                  });
                },
              ),
              RadioListTile(
                value: "E-Wallet",
                groupValue: metodePembayaran,
                title: const Text("E-Wallet (DANA / OVO / GoPay)"),
                onChanged: (value) {
                  setState(() {
                    metodePembayaran = value.toString();
                  });
                },
              ),
              const SizedBox(height: 20),
              const Text(
                "Ringkasan Pesanan",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              ...cart.map((item) => ListTile(
                    title: Text(item.name),
                    subtitle: Text(format.format(item.price)),
                  )),
              const Divider(),
              Text(
                "Total: ${format.format(totalHarga)}",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("Pesanan Berhasil 🎉"),
                          content: Text(
                            "Terima kasih ${_nameController.text}!\n"
                            "Pesanan kamu akan dikirim ke ${_addressController.text}.\n\n"
                            "Metode pembayaran: $metodePembayaran\n"
                            "Total: ${format.format(totalHarga)}",
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pop(context); // kembali ke keranjang
                                CartModel.clearCart(); // kosongkan keranjang
                              },
                              child: const Text("OK"),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFA47551),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 14),
                  ),
                  child: const Text("Konfirmasi Pesanan"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
