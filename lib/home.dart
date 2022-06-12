import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Authentication',
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: const Center(
          child: Text(
        'Home',
        style: TextStyle(fontSize: 25),
      )),
    );
  }
}
