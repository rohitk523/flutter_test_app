import 'package:flutter/material.dart';
import 'package:test_app/functions/bottomnavigator.dart';
import 'package:test_app/functions/drawerforos.dart';
import 'package:test_app/functions/mygridpage.dart';
import 'package:test_app/functions/randomgraphs.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Test'),
        ),
        body: Column(
          children: [
            RandomPieChart(),
            MyGridPage(),
            SizedBox(height: 20.0),
          ],
        ),
        bottomNavigationBar: BottomNavigationBarExample(),
        endDrawer: DrawerForOS(),

        //floatingActionButton: FloatingButtonExample(),
        //floatingActionButtonLocation:
        //    FloatingActionButtonLocation.centerFloat),
      ),
    );
  }
}
