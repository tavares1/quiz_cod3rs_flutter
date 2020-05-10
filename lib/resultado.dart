import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacaoTotal;

  final void Function() reiniciarQuiz;

  Resultado(this.pontuacaoTotal, this.reiniciarQuiz);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text('Acabou com ${this.pontuacaoTotal} pontos'),
        ),
        FlatButton(
          child: Text('Reiniciar?'),
          textColor: Colors.blue,
          onPressed: reiniciarQuiz,
        )
      ],
    );
  }
}
