import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetQuiz;

  Result(this.resultScore, this.resetQuiz);

  String get resultPhrase {
    var resultText = 'You did it';
    if (resultScore == 3) {
      resultText = 'We are identical';
    } else if (resultScore > 3 && resultScore < 10) {
      resultText = 'You seem Nice';
    } else if (resultScore > 10 && resultScore < 15) {
      resultText = 'You need improvement';
    } else {
      resultText = 'Stay Away';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            onPressed: resetQuiz,
            child: Text('Restart Quiz'),
            textColor: Colors.blue,
          )
        ],
      ),
    );
  }
}
