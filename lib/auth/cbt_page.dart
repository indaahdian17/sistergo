import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../widgets/common.dart';

class CbtPage extends StatelessWidget {
  const CbtPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CurvedHeader(title: 'CBT', height: 100, showBack: false),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 400,
                height: 400,
                child: const AssetOrIcon('assets/cbt.png',
                    icon: Icons.construction,
                    size: 160,
                    color: C.gold,
                    fit: BoxFit.contain),
              ),
              const Text('CBT Segera Hadir!',
                  style: TextStyle(fontSize: 34, color: C.black)),
              const SizedBox(height: 4),
              const Text('Fitur CBT sedang kami siapkan.\nTunggu sebentar,',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: C.grey)),
              const SizedBox(height: 120),
            ],
          ),
        ),
      ],
    );
  }
}