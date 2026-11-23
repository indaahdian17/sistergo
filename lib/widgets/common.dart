import 'package:flutter/material.dart';
import '../theme/colors.dart';

// ---------------- WIDGET BANTU ----------------
/// Gambar aset dengan fallback bila file belum ada.
class AssetOrIcon extends StatelessWidget {
  final String path;
  final IconData icon;
  final double size;
  final Color color;
  final BoxFit fit;
  const AssetOrIcon(this.path,
      {super.key,
      required this.icon,
      this.size = 40,
      this.color = Colors.white,
      this.fit = BoxFit.cover});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      fit: fit,
      errorBuilder: (_, __, ___) => Icon(icon, size: size, color: color),
    );
  }
}

class Avatar extends StatelessWidget {
  final double size;
  const Avatar({super.key, required this.size});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
          shape: BoxShape.circle, color: Color(0xFFFFE680)),
      clipBehavior: Clip.antiAlias,
      child: const AssetOrIcon('assets/avatar.png',
          icon: Icons.person, size: 60, color: Colors.white),
    );
  }
}

/// Header melengkung bawah (halaman dengan tombol kembali + judul).
class CurvedHeader extends StatelessWidget {
  final String title;
  final double height;
  final bool showBack;
  const CurvedHeader(
      {super.key,
      required this.title,
      this.height = 130,
      this.showBack = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: C.header,
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(24), bottomRight: Radius.circular(24)),
        boxShadow: softShadow,
      ),
      child: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            if (showBack)
              Positioned(
                left: 12,
                bottom: 14,
                child: GestureDetector(
                  onTap: () => Navigator.maybePop(context),
                  child:
                      const Icon(Icons.arrow_back, color: Colors.white, size: 28),
                ),
              ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: Text(title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w500)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
