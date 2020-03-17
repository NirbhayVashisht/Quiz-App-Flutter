import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  final questions = const [
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
        body: _questionIndex < questions.length
            ? Column(
                children: [
                  Question(questions[_questionIndex]['questionText']),

                  //below we are transforming the list into list of widgets
                  //map method executes a function which we have to pass as an argument
                  //so below we are passing an anonymous function
                  //... are spread operator
                  //all this is done in lec 33 Mapping List to Widgets
                  ...(questions[_questionIndex]['answers'] as List<String>)
                      .map((answer) {
                    return Answer(_answerQuestion, answer);
                  }).toList()
                ],
              )
            : Center(
                child: Text('You did it'),
              ),
      ),
    );
  }
}
