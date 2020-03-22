import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) quandoResponder;

  Questionario({
    @required this.perguntas,
    @required this.perguntaSelecionada,
    @required this.quandoResponder,
  });

  bool get dentroDoLimite {
    return perguntaSelecionada < perguntas.length;
  } 

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas =
        dentroDoLimite ? perguntas[perguntaSelecionada]['respostas'] : null;

    return Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelecionada]['pergunta']),
        ...respostas.map((resp) {
          return Resposta(
            resp['texto'],
            () => quandoResponder(resp['pontuacao']),
          );
        }).toList(),
      ],
    );
  }
}
