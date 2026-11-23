import 'package:flutter/material.dart';

// Warna & bayangan global SISTERGO
// ---------------- WARNA ----------------
class C {
  static const bg = Color(0xFFFFF0A8); // latar halaman
  static const header = Color(0xFFE3CF82); // header / panel
  static const input = Color(0xFFFFEBD6); // kolom input login
  static const orange = Color(0xFFFF5A20); // tombol utama
  static const red = Color(0xFFD50000); // teks merah
  static const grey = Color(0xFFA09A80); // teks abu
  static const yellowIcon = Color(0xFFFFE066);
  static const gold = Color(0xFFF5C518);
  static const olive = Color(0xFF7D8B6A);
  static const green = Color(0xFF4F6F23);
  static const black = Color(0xFF111111);
}

List<BoxShadow> get softShadow => [
      BoxShadow(
        color: Colors.black.withOpacity(0.25),
        blurRadius: 6,
        offset: const Offset(0, 3),
      ),
    ];
