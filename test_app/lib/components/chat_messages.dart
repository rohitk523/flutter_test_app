import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  final _message = TextEditingController();

  ChatScreen({super.key});
  void submit() async {
    await FirebaseFirestore.instance
        .collection('Chat')
        .doc('Chat 1-2')
        .set({'Message': _message.text.trim()});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Chat App'),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 8),
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _message,
                decoration:
                    const InputDecoration(labelText: 'Send a message...'),
                // Implement controller and state management for text input
              ),
            ),
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: () {
                // Implement sending message to Firestore
                submit();
              },
            ),
          ],
        ),
      ),
    );
  }
}
