import 'package:flutter/material.dart';

class NotificationsProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 4, 109, 109),
          title: const Text(
            'Not',
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: const Center(
          child: Text('Notification'),
        ));
  }
}
