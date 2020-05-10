import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) responder;

  Questionario({
    @required this.perguntas,
    @required this.perguntaSelecionada,
    @required this.responder,
  });

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas =
        perguntas.elementAt(perguntaSelecionada)['respostas'];

    return Column(
      children: [
        Questao(texto: perguntas.elementAt(perguntaSelecionada)['texto']),
        ...respostas
            .map((resposta) => Resposta(
                  resposta: resposta['texto'],
                  onSelection: () => responder(resposta['valor']),
                ))
            .toList(),
      ],
    );
  }
}
