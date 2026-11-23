import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../widgets/common.dart';
import 'izin_page.dart';

// ============================================================
//  2. HOME
// ============================================================
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  String get _tanggal {
    final n = DateTime.now();
    return '${n.day.toString().padLeft(2, '0')}/${n.month.toString().padLeft(2, '0')}';
  }

  Widget _sectionTitle(String t) => Padding(
        padding: const EdgeInsets.fromLTRB(20, 14, 20, 8),
        child: Text(t, style: const TextStyle(fontSize: 22, color: C.black)),
      );

  Widget _statusChip() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
            border: Border.all(color: C.red),
            borderRadius: BorderRadius.circular(20)),
        child: const Text('Belum Presensasi',
            style: TextStyle(color: C.red, fontSize: 14)),
      );

  Widget _presensiRow(String title) => Row(
        children: [
          Container(
            width: 66,
            height: 66,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Color(0xFFFFF0A8)),
            child: const Icon(Icons.person, size: 38, color: C.yellowIcon),
          ),
          const SizedBox(width: 18),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 19)),
                const Text('--: I --:', style: TextStyle(fontSize: 18)),
              ],
            ),
          ),
          _statusChip(),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header + kartu tanggal
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 250,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: C.header,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 20, 20, 0),
                    child: Row(
                      children: [
                        const Avatar(size: 130),
                        const SizedBox(width: 40),
                        const Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Hi',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16)),
                              Text('INDAH DIAN NOFITA',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18)),
                              SizedBox(height: 4),
                              Text('9230 I XI RPL 1 I SMK N 1 Bukateja',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 22,
                right: 22,
                bottom: -66,
                child: Container(
                  height: 130,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      color: C.bg,
                      borderRadius: BorderRadius.circular(34),
                      boxShadow: softShadow),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _infoItem(Icons.calendar_month, _tanggal, 'Tanggal'),
                      _infoItem(Icons.access_time, '06:00', 'Masuk'),
                      _infoItem(Icons.access_time, '14:30', 'Pulang'),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 76),

          // Presensi
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 4, 20, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Presensi', style: TextStyle(fontSize: 22)),
                Text('Lihat Semua',
                    style: TextStyle(color: C.red, fontSize: 17)),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: C.header,
                borderRadius: BorderRadius.circular(28),
                boxShadow: softShadow),
            child: Column(
              children: [
                _presensiRow('Presensi Masuk'),
                const SizedBox(height: 16),
                _presensiRow('Presensi Pulang'),
              ],
            ),
          ),

          // Jurnal PKL
          _sectionTitle('Jurnal PKL'),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
            decoration: BoxDecoration(
                color: C.header,
                borderRadius: BorderRadius.circular(28),
                boxShadow: softShadow),
            child: Column(
              children: [
                Container(
                  width: 82,
                  height: 82,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xFFFFF0A8)),
                  child: const Icon(Icons.book_outlined,
                      size: 38, color: C.yellowIcon),
                ),
                const SizedBox(height: 8),
                const Text('Periode PKL belum dimulai',
                    style: TextStyle(fontSize: 19)),
                const Text(
                  'Jurnal PKL kamu belum bisa diisi. Fitur ini aktif\notomatis saat periode',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: C.grey, fontSize: 15),
                ),
              ],
            ),
          ),

          // Jadwal Pelajaran
          _sectionTitle('Jadwal Pelajaran'),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            width: 450,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: C.header,
                borderRadius: BorderRadius.circular(20),
                boxShadow: softShadow),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('MAPEL KONSENTRASI REKAYASA PERANGKAT LUNAK',
                    style: TextStyle(fontSize: 15)),
                SizedBox(height: 6),
                Row(children: [
                  Icon(Icons.access_time, color: C.yellowIcon, size: 26),
                  SizedBox(width: 10),
                  Text('07.30 -', style: TextStyle(fontSize: 15)),
                ]),
                SizedBox(height: 6),
                Row(children: [
                  Icon(Icons.person, color: C.yellowIcon, size: 26),
                  SizedBox(width: 10),
                  Text('NUR ELING TYAS, S.Pd', style: TextStyle(fontSize: 15)),
                ]),
              ],
            ),
          ),

          // Perizinan
          _sectionTitle('Perizinan'),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 14),
            padding: const EdgeInsets.all(24),
            width: double.infinity,
            decoration: BoxDecoration(
                color: C.header,
                borderRadius: BorderRadius.circular(32),
                boxShadow: softShadow),
            child: Center(
              child: GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const IzinPage())),
                child: Container(
                  width: 232,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                      color: C.bg,
                      borderRadius: BorderRadius.circular(22),
                      boxShadow: softShadow),
                  child: Column(
                    children: const [
                      Icon(Icons.note_add_outlined,
                          size: 46, color: C.yellowIcon),
                      SizedBox(height: 4),
                      Text('Ajukan Izin', style: TextStyle(fontSize: 19)),
                      Text('Ajukan izin jika kamu\nberhalangan hadir',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: C.grey, fontSize: 15)),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _infoItem(IconData icon, String value, String label) => Row(
        children: [
          Icon(icon, size: 56, color: C.yellowIcon),
          const SizedBox(width: 8),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(value, style: const TextStyle(fontSize: 24)),
              Text(label,
                  style: const TextStyle(fontSize: 17, color: C.grey)),
            ],
          ),
        ],
      );
}