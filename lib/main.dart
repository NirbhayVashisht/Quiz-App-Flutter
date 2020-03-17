import 'package:flutter/material.dart';
import 'package:quiz_app/result.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  final _questions = const [
    {
      'questionText': 'What\'s your favourite color ?',
      'answers': ['red', 'yellow', 'blue', 'Other'],
    },
    {
      'questionText': 'What\'s your favourite food ?',
      'answers': ['Indian', 'Italian', 'Chinese', 'Other'],
    },
    {
      'questionText': 'What\'s your favourite animal ?',
      'answers': ['Dog', 'Cat', 'Lion', 'Other'],
    },
  ];

  void _answerQuestion() {
    setState(() {
      _questionIndex++;
    });
    print('Question Answered');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first app'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(),
      ),
    );
  }
}
