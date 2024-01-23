import 'package:flutter/material.dart';

class FloatingButtonExample extends StatelessWidget {
  const FloatingButtonExample({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: Colors.blue,
      child: const Icon(Icons.add),
    );
  }
}
