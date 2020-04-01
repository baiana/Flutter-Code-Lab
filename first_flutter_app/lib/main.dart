import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mantras/mantras.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        backgroundColor: Color.fromARGB(210, 208, 254, 245),
        appBar: AppBar(
          title: const Text(
            'Mantras do dia',
          ),
          backgroundColor: Color.fromARGB(255, 125, 206, 210),
        ),
        body: RandomMantras(),
      ),
    );
  }
}

class RandomMantraState extends State<RandomMantras> {
  final List<String> _suggestions = <String>[];

  @override
  Widget build(BuildContext context) {
    return _buildSuggestions();
    //final String mantraRandom = Mantras().getMantra();
    /*return Text(
      mantraRandom,
      style: Theme.of(context).textTheme.body2.merge(
          TextStyle(color: Color.fromARGB(255, 8, 20, 29), fontSize: 26)),
      textAlign: TextAlign.center,
    );*/
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.only(left: 16,top: 16,bottom: 16,right: 56),
        itemBuilder: (BuildContext _context, int i) {
          if (i.isOdd) {
            return Divider();
          }

          final int index = i ~/ 2;

          if (index >= _suggestions.length) {
            _suggestions.addAll(RandomMantras().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(String pair) {
    return ListTile(
      title: Text(
        pair,
        style: Theme.of(context).textTheme.body1.merge(
            TextStyle(color: Color.fromARGB(255, 8, 20, 29), fontSize: 16)),
        textAlign: TextAlign.start,
      ),
    );
  }
}

class RandomMantras extends StatefulWidget {
  @override
  RandomMantraState createState() => RandomMantraState();

  List<String> take(int number) {
    var list = List<String>();
    for (var i = 0; i < number; i++) {
      list.add(Mantras().getMantra());
    }
    return list;
  }
}
