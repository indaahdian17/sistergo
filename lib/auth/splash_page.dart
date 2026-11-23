import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../widgets/common.dart';
import 'login_page.dart';

// ============================================================
//  SPLASH SCREEN
//  Tampil sebentar (logo dalam lingkaran) lalu otomatis pindah ke Login.
// ============================================================
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _fade;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));
    _fade = CurvedAnimation(parent: _ctrl, curve: Curves.easeIn);
    _scale = Tween<double>(begin: 0.7, end: 1.0)
        .animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOutBack));
    _ctrl.forward();

    // Setelah 3 detik pindah ke halaman Login
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 500),
          pageBuilder: (_, __, ___) => const LoginPage(),
          transitionsBuilder: (_, anim, __, child) =>
              FadeTransition(opacity: anim, child: child),
        ),
      );
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: C.bg,
      body: Center(
        child: FadeTransition(
          opacity: _fade,
          child: ScaleTransition(
            scale: _scale,
            // Hanya lingkaran berisi logo (tulisan SISTERGO sudah ada di logo)
            child: Container(
              width: 295,
              height: 295,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: C.header,
                  boxShadow: softShadow),
              clipBehavior: Clip.antiAlias,
              padding: const EdgeInsets.all(22),
              child: const AssetOrIcon('assets/logo.png',
                  icon: Icons.school,
                  size: 120,
                  color: Color(0xFFE8955A),
                  fit: BoxFit.contain),
            ),
          ),
        ),
      ),
    );
  }
}
