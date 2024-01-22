import 'package:flutter/material.dart';
import 'package:test_app/functions/bottomnavigator.dart';
import 'package:test_app/functions/floatingbuttton.dart';
import 'package:test_app/functions/mygridpage.dart';
import 'package:test_app/functions/randomgraphs.dart';
import 'package:test_app/functions/searchingfield.dart';

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
      home: Scaffold(
          appBar: AppBar(
              title: const Center(child: Text('TestApp')),
              backgroundColor: Colors.blue),
          body: Column(
            children: [
              const SearchingField(),
              MyGridPage(),
              RandomPieChart(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBarExample(),
          floatingActionButton: FloatingButtonExample(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat),
    );
  }
}
