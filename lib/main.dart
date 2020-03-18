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
  var _totalScore = 0; 

  final _questions = const [
    {
      'questionText': 'What\'s your favourite color ?',
      'answers': [
        {'text': 'red', 'score': 1},
        {'text': 'black', 'score': 5},
        {'text': 'pink', 'score': 10},
        {'text': 'white', 'score': 3},
        {'text': 'other', 'score': 5},
      ],
    },
    {
      'questionText': 'What\'s your favourite food ?',
      'answers': [
        {'text': 'Indian', 'score': 1},
        {'text': 'Italian', 'score': 1},
        {'text': 'Chinese', 'score': 4},
        {'text': 'Other', 'score': 4},
      ],
    },
    {
      'questionText': 'What\'s your favourite animal ?',
      'answers': [
        {'text': 'Dog', 'score': 1},
        {'text': 'Cat', 'score': 10},
        {'text': 'Cow', 'score': 1},
        {'text': 'Snake', 'score': 10},
        {'text': 'Other', 'score': 4},
      ],
    },
  ];

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;
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
            : Result(_totalScore),
      ),
    );
  }
}
