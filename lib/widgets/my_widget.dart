import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final TextEditingController _controller = TextEditingController();

  void _handleSubmit() {
    // Handle the submitted text here
    print(_controller.text);

    FirebaseFirestore.instance.collection('testingx1').add({
      'text': _controller.text,
      'createdAt': Timestamp.now(),
      'userId': 'x1 uid',
      'username': 'my ysername',
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              hintText: 'Enter some text',
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _handleSubmit,
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
