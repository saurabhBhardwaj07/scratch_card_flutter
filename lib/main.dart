import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scratch_card/core/app_exports.dart';
import 'package:scratch_card/presentation/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(defaultOverlay);
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'Scratch Card',
        theme: theme,
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      );
    });
  }
}
