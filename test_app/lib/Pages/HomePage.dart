import 'package:flutter/material.dart';
import 'package:test_app/functions/mygridpage.dart';
import 'package:test_app/functions/randomgraphs.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            RandomPieChart(),
            MyGridPage(),
          ],
        ),
      ),
    );
  }
}
