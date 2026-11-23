import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../widgets/common.dart';

// ============================================================
//  7-10. PRESENSI WAJAH + dialog
//   - Ambil foto -> dialog pratinjau (Ambil Ulang / Gunakan Foto)
//   - Gunakan Foto -> dialog Wajah Terdeteksi (Tidak / Ya)
//   - Ya -> dialog Presensi Berhasil (Tutup)
//  Catatan: untuk kamera sungguhan ganti kotak pratinjau dengan
//  CameraPreview dari paket `camera`.
// ============================================================
class FaceAttendancePage extends StatelessWidget {
  const FaceAttendancePage({super.key});

  static const _lokasi =
      'No.77, Jalan Purbalingga - Banjarnegara, Majasari, Kecamatan Bukateja, Jawa Tengah, 53382, Indonesia';

  Widget _dialogShell(Widget child) => Dialog(
        backgroundColor: C.bg,
        insetPadding: const EdgeInsets.symmetric(horizontal: 32),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        child: child,
      );

  Widget _outlineBtn(BuildContext ctx, String t, VoidCallback onTap) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          height: 54,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(color: C.orange),
              borderRadius: BorderRadius.circular(27)),
          child: Text(t, style: const TextStyle(color: C.orange, fontSize: 16)),
        ),
      );

  Widget _fillBtn(String t, VoidCallback onTap) => GestureDetector(
        onTap: onTap,
        child: Container(
          height: 54,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: C.orange, borderRadius: BorderRadius.circular(27)),
          child: Text(t, style: const TextStyle(color: Colors.white, fontSize: 16)),
        ),
      );

  // Dialog 8: pratinjau foto
  void _showPreview(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => _dialogShell(
        Padding(
          padding: const EdgeInsets.fromLTRB(36, 60, 36, 50),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 330,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: softShadow,
                    color: Colors.black12),
                clipBehavior: Clip.antiAlias,
                child: const AssetOrIcon('assets/camera.png',
                    icon: Icons.photo, size: 80, color: C.header),
              ),
              const SizedBox(height: 44),
              Row(
                children: [
                  Expanded(
                      child: _outlineBtn(
                          ctx, 'Ambil Ulang', () => Navigator.pop(ctx))),
                  const SizedBox(width: 40),
                  Expanded(
                      child: _fillBtn('Gunakan Foto', () {
                    Navigator.pop(ctx);
                    _showDetected(context);
                  })),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Dialog 9: wajah terdeteksi
  void _showDetected(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => _dialogShell(
        Padding(
          padding: const EdgeInsets.fromLTRB(34, 30, 34, 50),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Wajah Terdeteksi', style: TextStyle(fontSize: 21)),
              const SizedBox(height: 16),
              Container(
                height: 58,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                    color: const Color(0xFFE9E3C8),
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: const [
                    Avatar(size: 48),
                    SizedBox(width: 18),
                    Text('INDAH DIAN NOFITA', style: TextStyle(fontSize: 21)),
                  ],
                ),
              ),
              const SizedBox(height: 22),
              const Text('Lokasi', style: TextStyle(fontSize: 21)),
              const SizedBox(height: 6),
              const Text(_lokasi,
                  style: TextStyle(fontSize: 21, color: C.grey, height: 1.1)),
              const SizedBox(height: 44),
              const Center(
                child: Text('Apakah Anda yakin melakukan presensasi?',
                    style: TextStyle(fontSize: 19)),
              ),
              const SizedBox(height: 22),
              Row(
                children: [
                  Expanded(
                      child: _outlineBtn(ctx, 'Tidak', () => Navigator.pop(ctx))),
                  const SizedBox(width: 56),
                  Expanded(
                      child: _fillBtn('Ya', () {
                    Navigator.pop(ctx);
                    _showSuccess(context);
                  })),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Dialog 10: berhasil
  void _showSuccess(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => _dialogShell(
        Padding(
          padding: const EdgeInsets.fromLTRB(36, 20, 36, 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 96,
                height: 96,
                decoration:
                    const BoxDecoration(shape: BoxShape.circle, color: C.green),
                child: const Icon(Icons.check, color: Colors.white, size: 60),
              ),
              const SizedBox(height: 14),
              const Text('Presensi Berhasil', style: TextStyle(fontSize: 21)),
              const Text('Berhasil Melakukan',
                  style: TextStyle(fontSize: 16, color: C.grey)),
              const SizedBox(height: 10),
              SizedBox(
                width: 222,
                child: _fillBtn('Tutup', () => Navigator.pop(ctx)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CurvedHeader(title: 'Presensi Wajah', height: 160),
          const SizedBox(height: 56),
          // Area pratinjau kamera
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 66),
            height: 520,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18), color: Colors.black12),
            clipBehavior: Clip.antiAlias,
            width: double.infinity,
            child: const AssetOrIcon('assets/camera.png',
                icon: Icons.videocam, size: 90, color: C.header),
          ),
          const SizedBox(height: 40),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 66),
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
            width: double.infinity,
            decoration: BoxDecoration(
                color: C.header, borderRadius: BorderRadius.circular(18)),
            child: const Text(
              'Pastikan wajah terlihat jelas dsan tidak\nmenggunakan masker/topeng',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 19),
            ),
          ),
          const Spacer(),
          // Tombol kamera
          GestureDetector(
            onTap: () => _showPreview(context),
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: softShadow),
              child: const Icon(Icons.photo_camera_outlined,
                  size: 66, color: C.gold),
            ),
          ),
          const SizedBox(height: 28),
        ],
      ),
    );
  }
}
