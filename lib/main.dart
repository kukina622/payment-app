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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.transparent),
        useMaterial3: true,
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == "/cards") {
          return PageRouteBuilder(
            settings: settings,
            pageBuilder: (_, __, ___) => const Cards(),
            transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
          );
        } else if (settings.name == "/analytics") {
          return PageRouteBuilder(
            settings: settings,
            pageBuilder: (_, __, ___) => const Analytics(),
            transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
          );
        } else if (settings.name == "/") {
          return PageRouteBuilder(
            settings: settings,
            pageBuilder: (_, __, ___) => const Home(),
            transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
          );
        }
        return null;
      },
    );
  }
}
