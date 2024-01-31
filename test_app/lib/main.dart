import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_app/Pages/eventpage.dart';
import 'package:test_app/Pages/gamespage.dart';
import 'package:test_app/Pages/homebottomnavigationbar.dart';
import 'package:test_app/Pages/settingspage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:test_app/functions/loginorsignup.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: '/home',
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            return HomeBottomNavigationBar();
          } else {
            return LoginOrSignUp();
          }
        },
      ),
      //routes: {
      //'/': (context) => LoginPage(),
      //  '/home': (context) => const LoginOrSignUp(),
      //  '/bottomnavigator': (context) => const HomeBottomNavigationBar(),
      //  '/event': (context) => const EventPage(),
      //  '/settings': (context) => const SettingsPage(),
      //  '/games': (context) => const GamesPage()
      //},
    );
  }
}
