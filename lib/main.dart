import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  var questionIndex = 0;

  void answerQuestion() {
    questionIndex = questionIndex + 1;
    print(questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = ['Koja ti je najdraza boja?', 'Koja ti je omiljena hrana?'];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Facebook'),
        ),
        body: Column(
          children: [
            Text(questions[questionIndex]),
            ElevatedButton(
              onPressed: answerQuestion,
              child: const Text('Odgovor 1'),
            ),
            const ElevatedButton(
              onPressed: null,
              child: Text('Odgovor 2'),
            ),
            const ElevatedButton(
              onPressed: null,
              child: Text('Odgovor 3'),
            ),
          ],
        ),
      ),
    );
  }
}
