import 'package:flutter/material.dart';
import 'package:mantras/mantras.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    String mantra = Mantras().getMantra();
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Aqui está a app bar',
          ),
          backgroundColor: Colors.amber,
        ),
        body: Center(
          child: Text(mantra),
        ),
      ),
    );
  }
}
