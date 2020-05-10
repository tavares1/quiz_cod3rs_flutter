import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String resposta;

  final void Function() onSelection;

  Resposta({this.resposta, this.onSelection});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      margin: EdgeInsets.fromLTRB(4, 10, 4, 10),
      child: RaisedButton(
        textColor: Colors.white,
        color: Colors.blue,
        child: Text(this.resposta),
        onPressed: this.onSelection,
      ),
    );
  }
}
