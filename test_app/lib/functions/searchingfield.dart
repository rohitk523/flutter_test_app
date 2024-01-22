import 'package:flutter/material.dart';

class SearchingField extends StatelessWidget {
  const SearchingField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        labelText: 'Enter text',
        hintText: 'Type something...',
        prefixIcon: Icon(Icons.text_fields),
        suffixIcon: Icon(Icons.clear),
        border: OutlineInputBorder(),
      ),
      onChanged: (value) {},
    );
  }
}
