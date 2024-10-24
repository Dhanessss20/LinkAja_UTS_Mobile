import 'package:flutter/material.dart';
import 'widgets/splash_screen.dart'; // Import splash screen
import 'app.dart'; // Pastikan Anda mengimpor app.dart

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Layout Demo',
      initialRoute: '/', // Tentukan route awal
      routes: {
        '/': (context) => const SplashScreen(), // Splash screen sebagai route awal
        '/home': (context) => const App(), // Halaman home
      },
    );
  }
}
