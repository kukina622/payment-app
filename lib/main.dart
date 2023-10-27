import 'package:flutter/material.dart';
import 'package:payment_app/pages/analytics/analytics.dart';
import 'package:payment_app/pages/cards/cards.dart';
import 'package:payment_app/pages/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simply.',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/cards': (context) => const Cards(),
        '/analytics': (context) => const Analytics(),
      },
    );
  }
}
