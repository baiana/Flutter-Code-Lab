import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mantras/mantras.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mantras',
      theme: ThemeData(brightness: Brightness.light),
      home: Scaffold(
        backgroundColor: Color.fromARGB(210, 208, 254, 245),
        body: RandomMantras(),
      ),
    );
  }
}

class RandomMantraState extends State<RandomMantras> {
  final List<String> _suggestions = <String>[];
  final Set<String> _saved = Set<String>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mantras do dia',
        ),
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.only(right: 26),
            icon: Icon(Icons.book),
            onPressed: _pushSaved,
          )
        ],
        backgroundColor: Color.fromARGB(254, 125, 206, 210),
      ),
      body: _buildSuggestions(),
    );
    return _buildSuggestions();
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(10),
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

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        // Add 20 lines from here...

        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = _saved.map(
            (String pair) {
              return ListTile(
                title: Text(
                  pair,
                  style: Theme.of(context).textTheme.body1.merge(TextStyle(
                      color: Color.fromARGB(255, 8, 20, 29), fontSize: 16)),
                ),
              );
            },
          );
          final List<Widget> divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return Scaffold(
            // Add 6 lines from here...
            appBar: AppBar(
              title: Text('Mantras salvo!'),
            ),
            body: ListView(children: divided),
          );
        },
      ), // ... to here.
    );
  }

  Widget _buildRow(String pair) {
    final bool alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair,
        style: Theme.of(context).textTheme.body1.merge(
            TextStyle(color: Color.fromARGB(255, 8, 20, 29), fontSize: 16)),
        textAlign: TextAlign.start,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.pinkAccent : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
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
