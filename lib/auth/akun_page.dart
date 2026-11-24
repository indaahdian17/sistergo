import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../widgets/common.dart';
import 'data_diri_page.dart';
import 'login_page.dart';

class AkunPage extends StatelessWidget {
  const AkunPage({super.key});

  Widget _stat(String n, String l) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(n, style: const TextStyle(fontSize: 30, height: 1.1)),
          Text(l, style: const TextStyle(fontSize: 22, color: C.grey)),
        ],
      );

  Widget _menu(IconData icon, String t, {Color? iconColor, VoidCallback? onTap}) =>
      InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              Icon(icon, size: 34, color: iconColor ?? C.black),
              const SizedBox(width: 14),
              Expanded(child: Text(t, style: const TextStyle(fontSize: 19))),
              const Text('>', style: TextStyle(fontSize: 20, color: C.grey)),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: double.infinity,
                height: 300,
                decoration: const BoxDecoration(
                  color: C.header,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40)),
                ),
                child: SafeArea(
                  child: Column(
                    children: const [
                      SizedBox(height: 20),
                      Avatar(size: 140),
                      SizedBox(height: 8),
                      Text('INDAH DIAN NOFITA',
                          style: TextStyle(color: Colors.white, fontSize: 36)),
                      Text('XI RPL 1 I SMK Negeri 1 Bukateja',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 52,
                right: 52,
                bottom: -52,
                child: Container(
                  height: 112,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  decoration: BoxDecoration(
                      color: C.bg,
                      borderRadius: BorderRadius.circular(26),
                      boxShadow: softShadow),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _stat('0', 'Hadir'),
                      _stat('0', 'Sakit'),
                      _stat('0', 'Izin'),
                      _stat('0', 'Alpha'),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 70),
          // kartu profil
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 52),
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
            decoration: BoxDecoration(
                color: C.bg,
                borderRadius: BorderRadius.circular(22),
                boxShadow: softShadow),
            child: Column(
              children: [
                const Text('Profil', style: TextStyle(fontSize: 22)),
                _menu(Icons.person, 'Data', iconColor: C.yellowIcon, onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const DataDiriPage()));
                }),
                _menu(Icons.crop_free, 'Registrasi'),
                _menu(Icons.refresh, 'Reset'),
              ],
            ),
          ),
          const SizedBox(height: 56),
          // logout
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 52),
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 34),
            width: double.infinity,
            decoration: BoxDecoration(
                color: C.bg,
                borderRadius: BorderRadius.circular(22),
                boxShadow: softShadow),
            child: InkWell(
              onTap: () => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginPage()),
                  (_) => false),
              child: Row(
                children: const [
                  Icon(Icons.logout, size: 34, color: Colors.red),
                  SizedBox(width: 14),
                  Text('Logout', style: TextStyle(fontSize: 19)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}