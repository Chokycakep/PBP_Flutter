// lib/models/order_history_model.dart

class Orderdata {
  final String nama;
  final String alamat;
  final String metode;
  final DateTime tanggal;
  final String status;
  final double total;
  final List<String> items;

  Orderdata({
    required this.nama,
    required this.alamat,
    required this.metode,
    required this.tanggal,
    required this.status,
    required this.total,
    required this.items,
  });
}
