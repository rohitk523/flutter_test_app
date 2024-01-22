import 'package:flutter/material.dart';
import 'package:test_app/components/griditem.dart';

// ignore: use_key_in_widget_constructors
class MyGridPage extends StatelessWidget {
  final List<String> names = [
    'John',
    'Jane',
    'Bob',
    'Alice',
    'Rohit',
    'Rahul',
    'Virat',
    'Sachin'
  ];
  final List<IconData> icons = [
    Icons.person,
    Icons.person_outline,
    Icons.access_alarm,
    Icons.accessibility,
    Icons.bathroom,
    Icons.shower,
    Icons.comment,
    Icons.business,
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemCount: names.length,
        itemBuilder: (BuildContext context, int index) {
          return GridItem(name: names[index], icon: icons[index]);
        },
      ),
    );
  }
}
