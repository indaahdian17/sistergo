import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../widgets/common.dart';

// ============================================================
//  6. DATA DIRI
// ============================================================
class DataDiriPage extends StatelessWidget {
  const DataDiriPage({super.key});

  Widget _title(String t) => Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 2),
        child: Text(t, style: const TextStyle(fontSize: 21, color: C.black)),
      );

  Widget _label(String t, {double bottom = 12}) => Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 20, bottom),
        child: Text(t, style: const TextStyle(fontSize: 21, color: C.grey)),
      );

  @override
  Widget build(BuildContext context) {
    // nilai data personal (kolom kanan)
    const values = [
      'Indah Dian Nofita', // Nama
      'Banjarnegara', // Tempat Lahir
      '17 Mei 2009', // Tanggal Lahir
      'Perempuan', // Jenis Kelamin
      '0852-2940-7381', // Telepon
    ];

    return Scaffold(
      body: Column(
        children: [
          const CurvedHeader(title: 'Data Diri', height: 160),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(top: 40, bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _title('Data Personal'),
                  // Label kiri + nilai kanan
                  Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _label('Nama'),
                          _label('Tempat Lahir'),
                          _label('Tanggal Lahir'),
                          _label('Jenis Kelamin'),
                          _label('Telepon'),
                          _label('NIS'),
                          _label('NISN'),
                          _label('NIK'),
                          _label('Agama'),
                          _label('Alamat'),
                          _label('Anak Ke-'),
                          _label('Status Anak'),
                          _label('Nomor Surat Tanda\nLulus', bottom: 0),
                          _label('Tanggal Surat Tanda\nLulus'),
                        ],
                      ),
                      Positioned(
                        right: 20,
                        top: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            for (final v in values)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: Text(v,
                                    style: const TextStyle(
                                        fontSize: 21, color: C.black)),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 22),
                  _title('Data Orang Tua'),
                  _label('Nama Ayah'),
                  _label('Pekerjaan Ayah'),
                  _label('Nama Ibu'),
                  _label('Pekerjaan Ibu'),
                  _label('Alamat Orangtua'),
                  _label('Telepon Orangtua'),
                  const SizedBox(height: 22),
                  _title('Data Wali Murid'),
                  _label('Nama Wali Murid'),
                  _label('Pekerjaan Wali Murid'),
                  _label('Telepon Wali Murid'),
                  _label('Alamat Wali Murid'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
