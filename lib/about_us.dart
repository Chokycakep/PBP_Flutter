import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // ✅ pastikan ini ada

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  // ✅ Fungsi buka URL yang kompatibel semua versi
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw Exception('Tidak dapat membuka $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5E1C0),
      appBar: AppBar(
        title: const Text("Tentang Kami"),
        backgroundColor: const Color(0xFFA47551),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundColor: Color(0xFFA47551),
              backgroundImage: AssetImage('assets/images/profile.jpg'),
            ),
            const SizedBox(height: 20),
            const Text(
              "Putu Novita Darmadewi",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4E342E),
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              "NIM: 24111814007 | Kelas: 2024C",
              style: TextStyle(color: Color(0xFF4E342E)),
            ),
            const SizedBox(height: 20),
            const Text(
              "Halo semuanya 👋\nAku adalah pengembang aplikasi Caramel Café & Bakery, "
              "sebuah project sederhana yang dibuat dengan penuh semangat dan sedikit rasa manis 🍰. "
              "Aplikasi ini dibuat untuk memudahkan pelanggan dalam memesan kue dan minuman "
              "dengan tampilan yang hangat dan bernuansa karamel ☕.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF4E342E),
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "Tentang Caramel Café & Bakery",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4E342E),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Caramel Café & Bakery adalah toko kue dan kopi yang menghadirkan suasana hangat, "
              "aroma karamel yang khas, dan rasa manis yang menenangkan. "
              "Kami percaya bahwa setiap gigitan kue dan tegukan kopi bisa membawa sedikit kebahagiaan di hari kamu ✨.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF4E342E),
                height: 1.5,
              ),
            ),
            const SizedBox(height: 30),
            const Divider(color: Color(0xFFA47551), thickness: 1),
            const SizedBox(height: 10),
            const Text(
              "Hubungi Saya",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4E342E),
              ),
            ),
            const SizedBox(height: 10),

            // ✅ Tombol GitHub yang bisa diklik
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.link, color: Color(0xFFA47551)),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () => _launchUrl("https://github.com/Chokycakep"),
                  child: const Text(
                    "github.com/Chokycakep",
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),

            // ✅ Tombol Instagram yang bisa diklik
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.camera_alt, color: Color(0xFFA47551)),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () => _launchUrl("https://www.instagram.com/Ncvtq"),
                  child: const Text(
                    "@Ncvtq",
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),
            const Text(
              "Terima kasih sudah menggunakan aplikasi ini 💕",
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xFF4E342E)),
            ),
          ],
        ),
      ),
    );
  }
}
