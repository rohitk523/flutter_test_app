import 'package:flutter/material.dart';
import 'package:test_app/Pages/homebottomnavigationbar.dart';

class DialogExample extends StatelessWidget {
  final String title;
  final String result;
  const DialogExample({
    super.key,
    required this.title,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(title),
          content: Text(result),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeBottomNavigationBar())),
              child: Text('OK'),
            ),
          ],
        ),
      ),
      child: const Text('Login'),
    );
  }
}
