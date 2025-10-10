import 'package:flutter/material.dart';
import '../models/cart_model.dart';
import 'checkout_detail.dart'; // ✅ Import halaman checkout
import 'order_history.dart'; // ✅ Tambahkan import halaman riwayat pesanan

/// Halaman keranjang belanja
class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cart = CartModel.cartItems;
    final totalHarga = CartModel.totalPrice;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Keranjang Saya"),
        backgroundColor: const Color(0xFFA47551),
        foregroundColor: Colors.white,
      ),
      backgroundColor: const Color(0xFFF5E1C0),
      body: cart.isEmpty
          ? const Center(
              child: Text(
                "Keranjang masih kosong 🛒",
                style: TextStyle(color: Color(0xFF4E342E), fontSize: 16),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final item = cart[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: ListTile(
                          leading:
                              const Icon(Icons.cake, color: Color(0xFFA47551)),
                          title: Text(item.name),
                          subtitle: Text("Rp ${item.price} x 1"),
                          trailing: IconButton(
                            icon: const Icon(Icons.remove_circle_outline),
                            onPressed: () {
                              setState(() {
                                CartModel.removeFromCart(item);
                              });
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  color: const Color(0xFFFFF8F1),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total: Rp $totalHarga",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF4E342E),
                              fontSize: 16,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // ✅ Navigasi ke halaman checkout
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      CheckoutDetail(totalHarga: totalHarga),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFA47551),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 12),
                            ),
                            child: const Text("Checkout"),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      // ✅ Tombol Riwayat Pesanan
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const OrderHistoryPage(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF8D6E63),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                        ),
                        icon: const Icon(Icons.history),
                        label: const Text("Lihat Riwayat Pesanan"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
