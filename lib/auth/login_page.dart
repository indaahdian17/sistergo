import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../widgets/common.dart';
import 'main_shell.dart';

// ============================================================
//  1. LOGIN
// ============================================================
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _userCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  bool _hide = true;

  @override
  void dispose() {
    _userCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  InputDecoration _dec(String hint, {Widget? suffix}) => InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: C.black, fontSize: 17),
        filled: true,
        fillColor: C.input,
        suffixIcon: suffix,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 22),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22), borderSide: BorderSide.none),
      );

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: C.bg,
      body: Stack(
        children: [
          // Logo lingkaran
          Positioned(
            top: h * 0.11,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 190,
                height: 190,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: C.header,
                    boxShadow: softShadow),
                clipBehavior: Clip.antiAlias,
                padding: const EdgeInsets.all(18),
                child: const AssetOrIcon('assets/logo.png',
                    icon: Icons.school,
                    size: 90,
                    color: Color(0xFFE8955A),
                    fit: BoxFit.contain),
              ),
            ),
          ),
          // Panel bawah melengkung
          Positioned(
            top: h * 0.37,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: C.header,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(70), topRight: Radius.circular(70)),
                boxShadow: softShadow,
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 640),
                  margin: const EdgeInsets.only(top: 60, left: 50, right: 50),
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                      color: C.bg,
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: softShadow),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                          controller: _userCtrl,
                          style: const TextStyle(fontSize: 18),
                          decoration: _dec('Masukkan NIS atau Username')),
                      const SizedBox(height: 22),
                      TextField(
                        controller: _passCtrl,
                        style: const TextStyle(fontSize: 18),
                        obscureText: _hide,
                        decoration: _dec(
                          'Masukkan Password',
                          suffix: IconButton(
                            icon: Icon(
                                _hide
                                    ? Icons.remove_red_eye_outlined
                                    : Icons.visibility_off_outlined,
                                color: C.black),
                            onPressed: () => setState(() => _hide = !_hide),
                          ),
                        ),
                      ),
                      const SizedBox(height: 44),
                      GestureDetector(
                        onTap: () => Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) => const MainShell())),
                        child: Container(
                          height: 60,
                          width: double.infinity,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: C.header,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: softShadow),
                          child: const Text('Login',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
