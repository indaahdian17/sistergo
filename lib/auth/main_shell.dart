import 'package:flutter/material.dart';
import '../theme/colors.dart';
import 'home_page.dart';
import 'lms_page.dart';
import 'cbt_page.dart';
import 'akun_page.dart';
import 'presensi_wajah_page.dart';

// ============================================================
//  SHELL + BOTTOM NAV (Home, LMS, Presensi, CBT, Akun)
// ============================================================
class MainShell extends StatefulWidget {
  const MainShell({super.key});
  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _index = 0; // 0 Home, 1 LMS, 3 CBT, 4 Akun

  final _pages = const [
    HomePage(),
    LmsPage(),
    SizedBox(), // placeholder Presensi (membuka halaman baru)
    CbtPage(),
    AkunPage(),
  ];

  Widget _item(int i, String label, IconData icon) {
    final selected = _index == i;
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => setState(() => _index = i),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(icon, size: 44, color: selected ? C.yellowIcon : Colors.white),
            Text(label,
                style: TextStyle(
                    fontSize: 14,
                    color: selected ? C.yellowIcon : C.header.withOpacity(0.9))),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _index, children: _pages),
      bottomNavigationBar: SizedBox(
        height: 96,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: 92,
              child: Container(
                decoration: BoxDecoration(
                  color: C.header,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(28),
                      topRight: Radius.circular(28)),
                  boxShadow: softShadow,
                ),
                child: Row(
                  children: [
                    _item(0, 'Home', Icons.home_rounded),
                    _item(1, 'LMS', Icons.school_rounded),
                    const Expanded(child: SizedBox()), // ruang tombol tengah
                    _item(3, 'CBT', Icons.assignment_rounded),
                    _item(4, 'Akun', Icons.person_rounded),
                  ],
                ),
              ),
            ),
            // Tombol Presensi (tengah, menonjol)
            Positioned(
              top: -4,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const FaceAttendancePage())),
                    child: Container(
                      width: 104,
                      height: 104,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: C.olive),
                      alignment: Alignment.center,
                      child: Container(
                        width: 84,
                        height: 84,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: C.gold),
                        child: const Icon(Icons.face_retouching_natural,
                            size: 48, color: C.olive),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 12,
              left: 0,
              right: 0,
              child: const Center(
                child: Text('Presensi',
                    style: TextStyle(fontSize: 14, color: Color(0xFFF3E7B0))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
