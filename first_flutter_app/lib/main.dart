import 'package:flutter/material.dart';
import 'package:mantras/mantras.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Olha essa mensagem motivacional',
          ),
          backgroundColor: Colors.amber,
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 20, left: 20, right: 20)),
              Center(child: RandomMantras())
            ]),
      ),
    );
  }
}

class RandomMantraState extends State<RandomMantras> {
  @override
  Widget build(BuildContext context) {
    final String mantraRandom = Mantras().getMantra();
    return Text(
      mantraRandom,
      style: Theme.of(context)
          .textTheme
          .title
          .merge(TextStyle(color: Colors.black)),
      textAlign: TextAlign.center,
    );
  }
}

class RandomMantras extends StatefulWidget {
  @override
  RandomMantraState createState() => RandomMantraState();
}


