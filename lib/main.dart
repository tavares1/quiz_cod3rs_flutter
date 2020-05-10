import 'package:flutter/material.dart';
import 'package:projeto_quiz/resposta.dart';
import './questao.dart';

main(List<String> args) {
  runApp(PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {

  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;  
    });  
  }

  final _perguntas = [ 
    "qual a sua cor favorita?",
    "qual seu animal favorito?"
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aplicativo de Quizz",
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz de bobeira'),
        ),
        body: Column(
          children: [
            Questao(texto: _perguntas.elementAt(_perguntaSelecionada)),
            Resposta(resposta: 'Resposta 1'),
            Resposta(resposta: 'Resposta 2'),
            Resposta(resposta: 'Resposta 3'),
          ],
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}