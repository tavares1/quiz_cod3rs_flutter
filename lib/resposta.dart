import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String resposta;

  Resposta({this.resposta});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      textColor: Colors.pink,
      color: Colors.white,
      child: Text(this.resposta),
      onPressed: () => {
        print('')
      },
    );
  }
}
