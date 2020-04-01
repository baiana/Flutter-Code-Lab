import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Aqui está a app bar',),
          backgroundColor: Colors.amber,
        ),
        body: const Center(
          child: const Text('olá! galeura'),
        ),
      ),
    );
  }
}
