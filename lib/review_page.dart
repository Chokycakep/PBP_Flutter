import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  final TextEditingController _commentController = TextEditingController();
  int _selectedRating = 0;
  List<Map<String, dynamic>> reviews = [];

  @override
  void initState() {
    super.initState();
    _loadReviews();
  }

  /// 🔹 Ambil ulasan yang disimpan di SharedPreferences
  Future<void> _loadReviews() async {
    final prefs = await SharedPreferences.getInstance();
    final String? saved = prefs.getString('reviews');
    if (saved != null) {
      setState(() {
        reviews = List<Map<String, dynamic>>.from(jsonDecode(saved));
      });
    } else {
      // Jika belum ada data, isi dengan contoh awal
      reviews = [
        {
          "name": "Ayu",
          "rating": 5,
          "comment": "Cakenya enak banget! Teksturnya lembut 🍰"
        },
        {
          "name": "Rizal",
          "rating": 4,
          "comment": "Rasa caramelnya pas, cuma agak manis dikit."
        },
      ];
      await _saveReviews();
    }
  }

  /// 🔹 Simpan ulasan ke SharedPreferences
  Future<void> _saveReviews() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('reviews', jsonEncode(reviews));
  }

  /// 🔹 Tambah ulasan baru dan simpan
  void _addReview() async {
    if (_commentController.text.isEmpty || _selectedRating == 0) return;

    setState(() {
      reviews.add({
        "name": "Kamu",
        "rating": _selectedRating,
        "comment": _commentController.text,
      });
    });

    await _saveReviews(); // simpan ke penyimpanan
    _commentController.clear();
    setState(() {
      _selectedRating = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5E1C0),
      appBar: AppBar(
        title: const Text("Ulasan Pelanggan"),
        backgroundColor: const Color(0xFFA47551),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Daftar Ulasan
            Expanded(
              child: ListView.builder(
                itemCount: reviews.length,
                itemBuilder: (context, index) {
                  final review = reviews[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(
                        review["name"],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFA47551),
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: List.generate(
                              5,
                              (i) => Icon(
                                i < review["rating"]
                                    ? Icons.star
                                    : Icons.star_border,
                                color: const Color(0xFFFFC107),
                                size: 18,
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(review["comment"]),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const Divider(),

            // Form Tambah Ulasan
            const Text(
              "Tulis Ulasanmu:",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4E342E),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                (i) => IconButton(
                  icon: Icon(
                    i < _selectedRating ? Icons.star : Icons.star_border,
                    color: const Color(0xFFFFC107),
                  ),
                  onPressed: () {
                    setState(() {
                      _selectedRating = i + 1;
                    });
                  },
                ),
              ),
            ),
            TextField(
              controller: _commentController,
              decoration: const InputDecoration(
                hintText: "Tulis komentar...",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _addReview,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFA47551),
                foregroundColor: Colors.white,
              ),
              child: const Text("Kirim Ulasan"),
            ),
          ],
        ),
      ),
    );
  }
}
