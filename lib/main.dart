import 'package:flutter/material.dart';
import 'package:payment_app/pages/analytics/analytics.dart';
import 'package:payment_app/pages/cards/cards.dart';
import 'package:payment_app/pages/home/home.dart';
import 'package:payment_app/pages/profile/profile.dart';
import 'package:payment_app/pages/scanner/scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final bool isFirst = prefs.getBool('isFirst') ?? true;
  String initialRoute = isFirst ? "/" : "/cards";
  runApp(MyApp(initialRoute: initialRoute));
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  const MyApp({super.key, this.initialRoute = "/"});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simply.',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.transparent),
        useMaterial3: true,
      ),
      initialRoute: initialRoute,
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
        } else if (settings.name == "/scanner") {
          return PageRouteBuilder(
            settings: settings,
            pageBuilder: (_, __, ___) => const Scanner(),
            transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
          );
        } else if (settings.name == "/profile") {
          return PageRouteBuilder(
            settings: settings,
            pageBuilder: (_, __, ___) => const Profile(),
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
