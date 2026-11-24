import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../widgets/common.dart';

class IzinPage extends StatefulWidget {
  const IzinPage({super.key});
  @override
  State<IzinPage> createState() => _IzinPageState();
}

class _IzinPageState extends State<IzinPage> {
  final _judul = TextEditingController();
  final _jenis = TextEditingController();
  final _mulaiTgl = TextEditingController();
  final _mulaiJam = TextEditingController();
  final _selesaiTgl = TextEditingController();
  final _selesaiJam = TextEditingController();
  final _alasan = TextEditingController();
  final _lampiran = TextEditingController();
 
  @override
  void dispose() {
    for (final c in [
      _judul, _jenis, _mulaiTgl, _mulaiJam,
      _selesaiTgl, _selesaiJam, _alasan, _lampiran
    ]) {
      c.dispose();
    }
    super.dispose();
  }

  OutlineInputBorder get _border => OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: Color(0xFFA0A0A0), width: 1.3),
      );

  Widget _field(TextEditingController c,
      {int lines = 1, bool readOnly = false, VoidCallback? onTap}) {
    return TextField(
      controller: c,
      minLines: lines,
      maxLines: lines,
      readOnly: readOnly,
      onTap: onTap,
      style: const TextStyle(fontSize: 18),
      decoration: InputDecoration(
        isDense: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
        enabledBorder: _border,
        focusedBorder: _border,
        border: _border,
      ),
    );
  }

  Widget _label(String t) => Padding(
        padding: const EdgeInsets.only(top: 14, bottom: 6, left: 4),
        child: Text(t, style: const TextStyle(fontSize: 19, color: C.black)),
      );

  Future<void> _pickDate(TextEditingController c) async {
    final d = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2035),
    );
    if (d != null) {
      c.text =
          '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
    }
  }

  Future<void> _pickTime(TextEditingController c) async {
    final t = await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (t != null) {
      c.text =
          '${t.hour.toString().padLeft(2, '0')}:${t.minute.toString().padLeft(2, '0')}';
    }
  }

  Widget _dateTimeRow(TextEditingController tgl, TextEditingController jam) =>
      Row(
        children: [
          Expanded(
              flex: 5,
              child: _field(tgl, readOnly: true, onTap: () => _pickDate(tgl))),
          const SizedBox(width: 44),
          Expanded(
              flex: 3,
              child: _field(jam, readOnly: true, onTap: () => _pickTime(jam))),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          const CurvedHeader(title: 'Buat izin', height: 105),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(28, 14, 28, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text('Masukkan data perizinan dengan sebenar-benarnya',
                        style: TextStyle(fontSize: 18, color: C.black)),
                  ),
                  _label('Judul'),
                  _field(_judul),
                  _label('Jenis izin'),
                  _field(_jenis),
                  _label('Mulai izin'),
                  _dateTimeRow(_mulaiTgl, _mulaiJam),
                  _label('Selesai izin'),
                  _dateTimeRow(_selesaiTgl, _selesaiJam),
                  _label('Alasan'),
                  _field(_alasan, lines: 6),
                  _label('Lampiran izin'),
                  _field(_lampiran),
                  const SizedBox(height: 120),
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Izin dikirim')));
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 66,
                      width: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: C.orange,
                          borderRadius: BorderRadius.circular(33),
                          boxShadow: softShadow),
                      child: const Text('Submit',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}