import 'package:firebase_s_flutter/services/strings.dart';
import 'package:flutter/material.dart';

class LogoutProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 4, 109, 109),
          title: Text(
            Strings.logout,
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Center(
          child: Text(Strings.logout),
        ));
  }
}
