import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText = 'Uspjesno ste zavrsili kviz!';
    if (resultScore <= 8) {
      resultText = 'Super ste!';
    } else if (resultScore <= 12) {
      resultText = 'Nije lose!';
    } else if (resultScore <= 16) {
      resultText = 'Mozda bi trebali malo vise raditi na sebi!';
    } else {
      resultText = 'Loseeeee!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(
            child: Text('Resetiraj Kviz!'),
            style: TextButton.styleFrom(
              primary: Colors.blue,
            ),
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}
