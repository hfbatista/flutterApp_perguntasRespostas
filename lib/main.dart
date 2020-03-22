import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resultado.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final List<Map<String, Object>> _perguntas = const [
    {
      'pergunta': 'Qual é sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 8},
        {'texto': 'Vermelho', 'pontuacao': 10},
        {'texto': 'Azul', 'pontuacao': 1},
        {'texto': 'Laranja', 'pontuacao': 3},
      ]
    },
    {
      'pergunta': 'Qual seu animal favorito?',
      'respostas': [
        {'texto': 'Leão', 'pontuacao': 8},
        {'texto': 'Cachorro', 'pontuacao': 10},
        {'texto': 'Coelho', 'pontuacao': 1},
        {'texto': 'Gato', 'pontuacao': 3},
      ]
    },
    {
      'pergunta': 'Qual seu Framework favorito?',
      'respostas': [
        {'texto': 'Ionic', 'pontuacao': 8},
        {'texto': 'Flutter', 'pontuacao': 10},
        {'texto': 'React Native', 'pontuacao': 1},
        {'texto': 'Angular', 'pontuacao': 5},
      ]
    }
  ];

  void _responder(pontuacao) {
    setState(() {
      _perguntaSelecionada++;
      _pontuacaoTotal += pontuacao;
    });
    print('Pergunta respondida $_pontuacaoTotal');
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get dentroDoLimite {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp (
        home: Scaffold (
            appBar: AppBar (
              title: Text ('Perguntas'),
            ),
            body: dentroDoLimite
                ? Questionario(
                    perguntas: _perguntas,
                    perguntaSelecionada: _perguntaSelecionada,
                    quandoResponder: _responder
                  )
                : Resultado(
                    _pontuacaoTotal,
                    _reiniciarQuestionario,
                  )
        )
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
