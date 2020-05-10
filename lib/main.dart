import 'package:flutter/material.dart';
import 'package:projeto_quiz/resposta.dart';
import './questao.dart';
import './resultado.dart';

main(List<String> args) {
  runApp(PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual sua cor favorita?',
      'respostas': ['Preto', 'Vermelho', 'Verde', 'Branco']
    },
    {
      'texto': 'Qual é seu animal favorito?',
      'respostas': ['Tatu', 'Minhoca', 'Girafa', 'Urubu']
    },
    {
      'texto': 'Qual é seu time favorito?',
      'respostas': ['Flamengo', 'Icasa', 'Fortaleza', 'Vasco']
    }
  ];

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas = temPerguntaSelecionada
        ? _perguntas.elementAt(_perguntaSelecionada)['respostas']
        : null;

    return MaterialApp(
      title: "Aplicativo de Quizz",
      home: Scaffold(
          appBar: AppBar(
            title: Text('Quiz de bobeira'),
          ),
          body: temPerguntaSelecionada
              ? Column(
                  children: [
                    Questao(
                        texto: _perguntas
                            .elementAt(_perguntaSelecionada)['texto']),
                    ...respostas
                        .map((resposta) => Resposta(
                              resposta: resposta,
                              onSelection: _responder,
                            ))
                        .toList(),
                  ],
                )
              : Resultado()),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
