import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:google_fonts/google_fonts.dart';
import './login_page.dart';

import 'package:flutter/foundation.dart';

void main() {
  runApp(DevicePreview(
      enabled: !kReleaseMode, builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'flutter demo',
      theme: ThemeData(
        textTheme: GoogleFonts.varelaRoundTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
