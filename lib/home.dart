import 'package:flutter/material.dart';
import 'detail.dart';

class HomePage extends StatelessWidget {
  final String userName;
  HomePage({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFE6D3),
      appBar: AppBar(
        title: const Text("Caramel Cafe & Bakery"),
        backgroundColor: const Color(0xFFA47551),
        foregroundColor: Colors.white,
      ),

      // HAMBURGER MENU (Drawer)
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
                Navigator.pop(context); // Tutup drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text("Keranjang"),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Menu Keranjang diklik")),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, "/login");
              },
            ),
          ],
        ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Selamat Datang
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Selamat datang, $userName! 🍩\nSelamat belanjaa 🎉",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4E342E),
              ),
            ),
          ),

          // ListView produk
          Expanded(
            child: ListView.builder(
              itemCount: DetailPage.cakes.length,
              itemBuilder: (context, index) {
                final cake = DetailPage.cakes[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: const Icon(Icons.cake, color: Color(0xFFA47551)),
                    title: Text(cake.name),
                    subtitle: Text("Rp ${cake.price}"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(cake: cake),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
