import 'package:flutter/material.dart';

import './quiz.dart';
import './answer.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      "questionText": "What's your favorite color",
      "answers": [
        {"text": "Black", "score": 10},
        {"text": "Yellow", "score": 8},
        {"text": "Orange", "score": 5},
        {"text": "Red", "score": 2}
      ]
    },
    {
      "questionText": "Which's your favorite animal",
      "answers": [
        {"text": "Rabbit", "score": 5},
        {"text": "Cat", "score": 12},
        {"text": "Dog", "score": 9},
        {"text": "Penguin", "score": 2}
      ]
    },
    {
      "questionText": "Who's your favorite instructor",
      "answers": [
        {"text": "Micah", "score": 1},
        {"text": "James", "score": 1},
        {"text": "Alvin", "score": 1},
        {"text": "Max", "score": 1}
      ]
    }
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;

    if (_questionIndex < _questions.length) {
      print("We have more questions");
    }
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text("My First Flutter App"),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions)
              : Result(_totalScore, _resetQuiz)),
    );
  }
}
