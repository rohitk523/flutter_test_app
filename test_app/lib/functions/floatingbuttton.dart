import 'package:flutter/material.dart';

class FloatingButtonExample extends StatelessWidget {
  const FloatingButtonExample({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.add),
      backgroundColor: Colors.blue,
    );
  }
}
