import 'package:flutter/material.dart';
import '../theme/colors.dart';

// ============================================================
//  3. LMS (Pembelajaran)
// ============================================================
class _Mapel {
  final String code, name, teacher;
  final Color dark, light;
  const _Mapel(this.code, this.name, this.teacher, this.dark, this.light);
}

class LmsPage extends StatelessWidget {
  const LmsPage({super.key});

  static const _mapel = [
    _Mapel('BIND', 'BAHASA INDONESIA', 'NUR YULININGTYAS, S.Pd',
        Color(0xFF55782A), Color(0xFFA1A843)),
    _Mapel('BING', 'BAHASA INGGRIS', 'YUNITA KUSUMA WARDHANI,S.Pd',
        Color(0xFF015A9E), Color(0xFF2F8CC1)),
    _Mapel('BJ', 'BAHASA JAWA', 'DYAN KARTIKAWATI, S.Pd', Color(0xFF451456),
        Color(0xFF611F5B)),
    _Mapel('BK', 'BIMBINGAN KONSELING', 'ABDI SHOLIH PRATAMA, S.Pd',
        Color(0xFF015A9E), Color(0xFF2F8CC1)),
    _Mapel('B.\nJEPANG', 'BAHASA JEPANG', 'IMAM MAULANA B, S.Pd',
        Color(0xFF632C14), Color(0xFF7E4220)),
  ];

  Widget _stat(String n, String label, Color c) => Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(n, style: TextStyle(color: c, fontSize: 22)),
            Text(label, style: const TextStyle(color: C.grey, fontSize: 22)),
          ],
        ),
      );

  Widget _pill(IconData icon, String t) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
            color: const Color(0xFFF1F1F1),
            borderRadius: BorderRadius.circular(22)),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Icon(icon, size: 24, color: Colors.grey.shade700),
          const SizedBox(width: 8),
          Text(t,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade700)),
        ]),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(30, 0, 20, 22),
          decoration: const BoxDecoration(
            color: C.header,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
          ),
          child: SafeArea(
            bottom: false,
            child: Row(
              children: [
                Container(
                  width: 82,
                  height: 82,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xFFFFEE9E)),
                  child: const Icon(Icons.school,
                      size: 48, color: C.yellowIcon),
                ),
                const SizedBox(width: 26),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Pembelajaran',
                        style: TextStyle(color: Colors.white, fontSize: 22)),
                    Text('SMK N 1 Bukateja - XI RPL 1 - Gasal 2026/2027',
                        style: TextStyle(
                            color: Color(0xFFF5E9B5), fontSize: 14)),
                  ],
                ),
              ],
            ),
          ),
        ),
        // Search
        Container(
          margin: const EdgeInsets.fromLTRB(30, 18, 30, 0),
          height: 52,
          decoration: BoxDecoration(
              color: C.header,
              borderRadius: BorderRadius.circular(16),
              boxShadow: softShadow),
          child: const TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search, size: 32, color: C.yellowIcon),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 14),
            ),
          ),
        ),
        // Statistik
        Container(
          margin: const EdgeInsets.fromLTRB(28, 16, 28, 14),
          height: 82,
          decoration: BoxDecoration(
              color: C.header,
              borderRadius: BorderRadius.circular(12),
              boxShadow: softShadow),
          child: Row(
            children: [
              _stat('14', 'Mata', C.red),
              Container(width: 1.5, color: C.bg),
              _stat('0', 'Mater', const Color(0xFF0B5C9E)),
              Container(width: 1.5, color: C.bg),
              _stat('0', 'Tugas', const Color(0xFF55782A)),
            ],
          ),
        ),
        // Daftar mapel
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.fromLTRB(28, 0, 28, 16),
            itemCount: _mapel.length,
            separatorBuilder: (_, __) => const SizedBox(height: 26),
            itemBuilder: (_, i) {
              final m = _mapel[i];
              return Container(
                height: 197,
                decoration: BoxDecoration(
                    color: C.header, borderRadius: BorderRadius.circular(26)),
                clipBehavior: Clip.antiAlias,
                child: Row(
                  children: [
                    Container(
                      width: 262,
                      color: m.dark,
                      alignment: Alignment.center,
                      child: Container(
                        width: 196,
                        height: 146,
                        decoration: BoxDecoration(
                            color: m.light,
                            borderRadius: BorderRadius.circular(26)),
                        alignment: Alignment.center,
                        child: Text(m.code,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                height: 1.2,
                                fontSize: m.code.length > 4 ? 32 : 36)),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 14, right: 4),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(m.name,
                                style: const TextStyle(
                                    fontSize: 19, color: C.black)),
                            Text(m.teacher,
                                maxLines: 1,
                                overflow: TextOverflow.clip,
                                style: const TextStyle(
                                    fontSize: 16, color: C.grey)),
                            const SizedBox(height: 14),
                            Row(
                              children: [
                                _pill(Icons.menu_book_outlined, '0 Materi'),
                                const SizedBox(width: 10),
                                _pill(Icons.description_outlined, '0 Tugas'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}