import 'package:flutter/material.dart';
import './quiz.dart';
import './answer.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Koja ti je najdraza boja?',
      'answers': [
        {'text': 'Crna', 'score': 10},
        {'text': 'Bijela', 'score': 5},
        {'text': 'Zelena', 'score': 3},
        {'text': 'Crvena', 'score': 1},
      ],
    },
    {
      'questionText': 'Koja ti je omiljena hrana?',
      'answers': [
        {'text': 'Spageti', 'score': 1},
        {'text': 'Pizza', 'score': 2},
        {'text': 'Riba', 'score': 3},
        {'text': 'Kruh', 'score': 5},
      ],
    },
    {
      'questionText': 'Koja ti je omiljeno pice?',
      'answers': [
        {'text': 'Voda', 'score': 2},
        {'text': 'Kola', 'score': 1},
        {'text': 'Fanta', 'score': 3},
        {'text': 'Sprite', 'score': 4},
      ],
    },
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
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('Imamo jos pitanja');
    } else {
      print('Nema vise pitanja');
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    // var dummy = const ['Hello']; //sa const nece raditi jer ocekuje da nece biti promjena.
    // dummy.add('Ivan');
    // print(dummy);

    //questions = []; ovo ne radi ako je question const

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Facebook'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
