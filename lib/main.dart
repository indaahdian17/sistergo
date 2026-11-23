import 'package:flutter/material.dart';
import 'auth/splash_page.dart';
import 'theme/colors.dart';

void main() => runApp(const SistergoApp());

class SistergoApp extends StatelessWidget {
  const SistergoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SISTERGO',
      theme: ThemeData(
        scaffoldBackgroundColor: C.bg,
        colorScheme: ColorScheme.fromSeed(seedColor: C.header),
        useMaterial3: true,
      ),
      // Desain dasar: lebar 720 x tinggi 1440 (sesuai screenshot).
      //  - Di HP (layar sempit): lebar desain 720, skala mengikuti lebar HP.
      //  - Di komputer/browser (layar lebar): tinggi desain 1440, skala
      //    mengikuti tinggi jendela, dan lebarnya memenuhi seluruh jendela.
      builder: (context, child) {
        final mq = MediaQuery.of(context);
        final wide = mq.size.width > mq.size.height * 0.75;
        final double scale, designW, designH;
        if (wide) {
          designH = 1440;
          scale = mq.size.height / designH;
          designW = mq.size.width / scale;
        } else {
          designW = 720;
          scale = mq.size.width / designW;
          designH = mq.size.height / scale;
        }
        return FittedBox(
          fit: BoxFit.fill,
          child: SizedBox(
            width: designW,
            height: designH,
            child: MediaQuery(
              data: mq.copyWith(
                size: Size(designW, designH),
                padding: mq.padding / scale,
                viewPadding: mq.viewPadding / scale,
                viewInsets: mq.viewInsets / scale,
                devicePixelRatio: mq.devicePixelRatio * scale,
              ),
              child: child!,
            ),
          ),
        );
      },
      home: const SplashPage(),
    );
  }
}
