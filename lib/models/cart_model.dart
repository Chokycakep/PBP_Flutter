import 'cake_model.dart';

// Tambahan untuk menyimpan riwayat pesanan
class OrderHistory {
  final String customerName;
  final String address;
  final String paymentMethod;
  final int total;
  final List<String> items;

  OrderHistory({
    required this.customerName,
    required this.address,
    required this.paymentMethod,
    required this.total,
    required this.items,
  });
}

class CartModel {
  static final List<CakeModel> cartItems = [];
  static final List<OrderHistory> orderHistory = []; // ✅ Menyimpan riwayat

  static void addToCart(CakeModel cake) {
    cartItems.add(cake);
  }

  static void removeFromCart(CakeModel cake) {
    cartItems.remove(cake);
  }

  static int get totalPrice {
    return cartItems.fold(0, (sum, item) => sum + item.price);
  }

  static void clearCart() {
    cartItems.clear();
  }

  // ✅ Tambahkan fungsi simpan riwayat pesanan
  static void addOrder({
    required String customerName,
    required String address,
    required String paymentMethod,
    required int total,
  }) {
    orderHistory.add(
      OrderHistory(
        customerName: customerName,
        address: address,
        paymentMethod: paymentMethod,
        total: total,
        items: cartItems.map((item) => item.name).toList(),
      ),
    );
  }
}
