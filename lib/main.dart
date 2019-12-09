import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    final wordPair = new WordPair.random(); // 이곳에서 만드는게 아님
    return MaterialApp(
      title: 'Startup Name Generator',
      home: RandomWords(),
//      title: 'Welcome To New Package',
//      home: Scaffold(
//        appBar: new AppBar(
//          title: Text('Called English Words'),
//        ),
//        body: Center(
////          child: new Text(wordPair.asPascalCase), // 위에서 만들었기때문에 사용했었음
//          child: RandomWords(),
//        ),
//      ),
    );
  }
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Startup Name Generator'),
        ),
        body: _buildSuggestions(),
    );
//    final wordPair = WordPair.random();
//    return Text(wordPair.asPascalCase);
  }
  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();

          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        }
    );
  }
  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

//void main() => runApp(new MyApp());
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build (BuildContext context) {
//    return new MaterialApp(
//      title: 'Welcome To Flutter',
//      home: new Scaffold(
//        appBar: new AppBar(
//          title: const Text('welcome to flutter'),
//        ),
//        body: const Center(
//          child: const Text('Hello WonYoung'),
//        ),
//      ),
//    );
//  }
//}
