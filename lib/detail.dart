import 'package:flutter/material.dart';
import '../models/cake_model.dart';
import '../models/cart_model.dart';
import 'cart_page.dart';

/// ✅ Halaman Kategori Menu
class CakeListPage extends StatelessWidget {
  const CakeListPage({super.key});

  final List<String> categories = const [
    "☕ Coffee Based",
    "🥛 Milk Based",
    "🍵 Tea Series",
    "☕ Kopi Susu",
    "🍨 Blend Series",
    "🍹 Squash",
    "🍛 Main Course",
    "🍟 Snack",
    "🍰 Sweet Treats",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5E1C0),
      appBar: AppBar(
        title: const Text("Menu Kategori"),
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
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(
                category,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: const Icon(Icons.arrow_forward_ios_rounded,
                  color: Color(0xFFA47551), size: 18),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MenuListPage(categoryName: category),
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

/// ✅ Halaman Daftar Menu Tiap Kategori
class MenuListPage extends StatelessWidget {
  final String categoryName;
  const MenuListPage({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    final menus = _getMenuForCategory(categoryName);

    return Scaffold(
      backgroundColor: const Color(0xFFF5E1C0),
      appBar: AppBar(
        title: Text(categoryName),
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
      body: ListView.builder(
        itemCount: menus.length,
        itemBuilder: (context, index) {
          final item = menus[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(item["name"]!),
              subtitle: Text(item["desc"]!),
              trailing: ElevatedButton(
                onPressed: () {
                  final cake = CakeModel(
                    name: item["name"]!,
                    price: 20000, // bisa diubah sesuai harga nanti
                    description: item["desc"]!,
                  );
                  CartModel.addToCart(cake);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content:
                          Text("${item["name"]} ditambahkan ke keranjang 🛒"),
                      backgroundColor: const Color(0xFFA47551),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
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

  /// ✅ Semua daftar menu & deskripsi lengkap
  List<Map<String, String>> _getMenuForCategory(String category) {
    switch (category) {
      case "☕ Coffee Based":
        return [
          {
            "name": "Espresso",
            "desc": "Kopi hitam pekat dengan rasa kuat dan aroma khas."
          },
          {
            "name": "Americano",
            "desc": "Espresso dicampur air panas, rasa ringan namun tetap kuat."
          },
          {
            "name": "Caffe Latte",
            "desc":
                "Perpaduan espresso dan susu lembut dengan lapisan foam tipis."
          },
          {
            "name": "Cappuccino",
            "desc": "Kopi susu dengan busa tebal di atasnya, creamy dan wangi."
          },
        ];
      case "🥛 Milk Based":
        return [
          {
            "name": "Chocolate",
            "desc": "Minuman cokelat hangat dengan rasa manis dan lembut."
          },
          {
            "name": "Red Velvet",
            "desc": "Perpaduan susu dan bubuk red velvet yang lembut."
          },
          {
            "name": "Matcha",
            "desc": "Susu matcha premium dengan rasa khas teh hijau Jepang."
          },
          {
            "name": "Taro",
            "desc": "Minuman ungu manis dengan aroma talas yang khas."
          },
        ];
      case "🍵 Tea Series":
        return [
          {
            "name": "Lemon Tea",
            "desc": "Teh segar berpadu dengan perasan lemon alami."
          },
          {
            "name": "Lychee Tea",
            "desc": "Teh manis dengan rasa leci yang menyegarkan."
          },
          {
            "name": "Berry Tea",
            "desc": "Campuran teh dan buah berry, segar dan aromatik."
          },
        ];
      case "☕ Kopi Susu":
        return [
          {
            "name": "Biscoff",
            "desc": "Kopi susu dengan rasa biskuit karamel khas Biscoff."
          },
          {
            "name": "Classic",
            "desc": "Kopi susu tradisional dengan rasa klasik yang nikmat."
          },
          {
            "name": "Almond",
            "desc": "Kopi susu dengan sentuhan almond gurih dan harum."
          },
          {
            "name": "Coconut",
            "desc": "Kopi susu berpadu santan kelapa lembut."
          },
          {
            "name": "Vanilla",
            "desc": "Kopi susu dengan aroma vanila manis dan creamy."
          },
        ];
      case "🍨 Blend Series":
        return [
          {
            "name": "Red Cookies",
            "desc": "Minuman blended red velvet dengan remahan cookies."
          },
          {
            "name": "Caramellow",
            "desc": "Blended caramel lembut berpadu susu dan es."
          },
          {
            "name": "Berry Purple",
            "desc": "Campuran buah berry segar dengan susu dan es."
          },
          {
            "name": "Regally Crackers",
            "desc": "Blended dengan biskuit regal dan krim susu."
          },
        ];
      case "🍹 Squash":
        return [
          {
            "name": "Miss Berry",
            "desc": "Minuman soda berry segar dengan potongan buah."
          },
          {
            "name": "Flea",
            "desc": "Squash tropis dengan aroma jeruk dan soda."
          },
          {
            "name": "Frizzy",
            "desc": "Minuman soda ringan dengan rasa menyegarkan."
          },
          {
            "name": "Yachi",
            "desc": "Squash khas Yuzu dengan kombinasi manis dan asam."
          },
        ];
      case "🍛 Main Course":
        return [
          {
            "name": "Nasi Goreng",
            "desc": "Nasi goreng spesial dengan telur dan ayam suwir."
          },
          {
            "name": "Bakmie Jawa",
            "desc": "Mie goreng khas Jawa dengan cita rasa manis gurih."
          },
          {
            "name": "Beef Bowl",
            "desc": "Nasi dengan daging sapi tumis dan saus teriyaki."
          },
          {
            "name": "Chicken Bowl",
            "desc": "Nasi dengan ayam goreng dan saus mentai creamy."
          },
        ];
      case "🍟 Snack":
        return [
          {
            "name": "Tempe Mendoan",
            "desc": "Tempe tipis digoreng setengah matang, gurih dan lembut."
          },
          {
            "name": "Onion Rings",
            "desc": "Cincin bawang goreng renyah dengan saus mayo."
          },
          {
            "name": "French Fries Mix Platter",
            "desc": "Kentang goreng dengan aneka saus pilihan."
          },
        ];
      case "🍰 Sweet Treats":
        return [
          {"name": "Slice Cake", "desc": "Potongan kue lembut berbagai rasa."},
          {
            "name": "Cookies",
            "desc": "Kue kering manis dengan aroma butter yang harum."
          },
          {
            "name": "Croissant",
            "desc": "Roti lapis renyah dengan rasa mentega nikmat."
          },
          {
            "name": "Brownies",
            "desc": "Kue cokelat padat dan lembut di dalam."
          },
          {
            "name": "Cheese Cake",
            "desc": "Kue keju lembut dengan rasa manis gurih seimbang."
          },
        ];
      default:
        return [];
    }
  }
}
