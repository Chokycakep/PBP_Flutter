import 'package:flutter/material.dart';
import 'detail.dart'; // ✅ hanya butuh CakeListPage
import 'cart_page.dart';
import 'order_history.dart';
import 'about_us.dart'; // ✅ Tambahan import untuk halaman About Us
import 'login.dart'; // ✅ Tambahan supaya tombol Logout bisa berfungsi

class HomePage extends StatelessWidget {
  final String userName;
  const HomePage({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5E1C0),
      appBar: AppBar(
        title: const Text("Caramel Cafe & Bakery"),
        backgroundColor: const Color(0xFFA47551),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartPage()),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFFA47551),
              ),
              accountName: Text(userName),
              accountEmail: const Text("customer@caramelcafe.com"),
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, color: Color(0xFFA47551)),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Beranda"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text("Keranjang"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CartPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text("Riwayat Pesanan"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OrderHistoryPage(),
                  ),
                );
              },
            ),
            // ✅ Tambahan menu About Us (tanpa ubah kode lain)
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text("Tentang Kami"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutUsPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () {
                Navigator.pop(context);
                // ✅ Perbaikan agar tombol logout bisa berfungsi
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sapaan pengguna
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Selamat datang, $userName! 🍩\nSelamat belanja 🎉",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4E342E),
              ),
            ),
          ),

          // Hanya 1 menu utama: semua kategori
          Expanded(
            child: ListView(
              children: [
                Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: const Icon(Icons.cake, color: Color(0xFFA47551)),
                    title: const Text("Lihat Semua Menu & Kategori"),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded,
                        color: Color(0xFFA47551), size: 18),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CakeListPage(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
