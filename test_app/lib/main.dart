import 'package:flutter/material.dart';
import 'package:test_app/Pages/eventpage.dart';
import 'package:test_app/Pages/gamespage.dart';
import 'package:test_app/Pages/homebottomnavigationbar.dart';
import 'package:test_app/Pages/settingspage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        //'/': (context) => LoginPage(),
        '/home': (context) => const HomeBottomNavigationBar(),
        '/event': (context) => const EventPage(),
        '/settings': (context) => const SettingsPage(),
        '/games': (context) => const GamesPage()
      },
    );
  }
}
