import 'package:first_app/answer.dart';
import 'package:first_app/question.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final questions = [
    {
      'questionText': 'what is your favorate color?',
      'answers': ['red', 'green', 'blue', 'black']
    },
    {
      'questionText': 'what is your favorate animal?',
      'answers': ['rabbit', 'snake', 'donkey', 'cat']
    },
    {
      'questionText': 'what is your favorate foortball player?',
      'answers': ['Rooney', 'Cr.Ronaldo', 'Nymar', 'Cavani']
    },
  ];

  var _quesetionIndex = 0;

  void _answerQuestion() {
    if (_quesetionIndex < questions.length) {
      setState(() {
        _quesetionIndex = _quesetionIndex + 1;
      });
    }

    print(_quesetionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('app title'),
        ),
        body: Column(
          children: [
            Question(
              questions[_quesetionIndex]['questionText'] as String,
            ),
            ...(questions[_quesetionIndex]['answers'] as List<String>)
                .map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
