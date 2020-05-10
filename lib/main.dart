import 'package:flutter/material.dart';
import 'package:projeto_quiz/questionario.dart';
import './resultado.dart';

main(List<String> args) {
  runApp(PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _valorTotal = 0;

  void _responder(int valor) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
    _valorTotal += valor;
  }

  final _perguntas = const [
    {
      'texto': 'Qual sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'valor': 3},
        {'texto': 'Vermelho', 'valor': 5},
        {'texto': 'Verde', 'valor': 7},
        {'texto': 'Branco', 'valor': 10},
      ]
    },
    {
      'texto': 'Qual é seu animal favorito?',
      'respostas': [
        {'texto': 'Tatu', 'valor': 3},
        {'texto': 'Elefante', 'valor': 5},
        {'texto': 'Corsa', 'valor': 7},
        {'texto': 'Urubu', 'valor': 10},
      ]
    },
    {
      'texto': 'Qual é seu time favorito?',
      'respostas': [
        {'texto': 'Grêmio', 'valor': 3},
        {'texto': 'Ituano', 'valor': 5},
        {'texto': 'Fortaleza', 'valor': 7},
        {'texto': 'Nenhum', 'valor': 10},
      ]
    }
  ];

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _reiniciarQuiz() {
    setState(() {
      _perguntaSelecionada = 0;
      _valorTotal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aplicativo de Quizz",
      home: Scaffold(
          appBar: AppBar(
            title: Text('Quiz de bobeira'),
          ),
          body: temPerguntaSelecionada
              ? Questionario(
                  perguntas: _perguntas,
                  perguntaSelecionada: _perguntaSelecionada,
                  responder: _responder,
                )
              : Resultado(_valorTotal, _reiniciarQuiz)),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
