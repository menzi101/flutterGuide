import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';
import './quiz.dart';
import './result.dart';

//void main() {
//runApp(MyBeginApp());
//}

void main() => runApp(MyBeginApp());

class MyBeginApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyBeginAppState();
  }
}

class _MyBeginAppState extends State<MyBeginApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favourite Colour?',
      'answers': [
        {'text': 'Black', 'score': 1},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 10},
      ],
    },
    {
      'questionText': 'What\'s your favourite Animal?',
      'answers': [
        {'text': 'Buffallo', 'score': 11},
        {'text': 'Cheater', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9},
      ],
    },
    {
      'questionText': 'Who\'s your favourite Instructor?',
      'answers': [
        {'text': 'Paulette', 'score': 10},
        {'text': 'Schmidhuber', 'score': 1},
        {'text': 'Graves', 'score': 4},
        {'text': 'Menzi', 'score': 11},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz(){
    setState(() {
        _questionIndex = 0;
    _totalScore = 0;
    });
  

  }

  void _answerQ(int score) {

    //_totalScore = _totalScore + score;
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print('Answer selected using named function.');
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQ: _answerQ,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
