import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';
import 'package:projeto_perguntas/resultado.dart';
import 'package:projeto_perguntas/questionario.dart';

void main() => runApp(const PerguntaApp());

class PerguntaAppState extends State<PerguntaApp> {
  var perguntaSelecionada = 0;  // Controla a pergunta selecionada
  int pontuacaoTotal = 0; // Controla a pontuação do jogador

  final List<Map<String, Object>> perguntas = const [
    {
      'texto': 'Qual o nome completo dessa pessoa?',
      'respostas': [
        'Kylian Mbappé Lottin',
        'Lionel Andrés Messi Cuccittini',
        'Neymar da Silva Santos Júnior',
        'Cristiano Ronaldo dos Santos Aveiro'
      ],
      'correta': 'Lionel Andrés Messi Cuccittini',
      'imagem': 'assets/images/messi1.jpg',
    },
    {
      'texto': 'Qual sua data de nascimento?',
      'respostas': [
        '24 de junho de 1987',
        '5 de fevereiro de 1985',
        '5 de fevereiro de 1992',
        '20 de dezembro de 1998'
      ],
      'correta': '24 de junho de 1987',
      'imagem': 'assets/images/messi2.jpg',
    },
    {
      'texto': 'Qual o nome do seu pai?',
      'respostas': [
        'Jorge Horacio Messi',
        'Neymar da Silva Santos',
        'José Dinis Aveiro',
        'Wilfried Mbappé'
      ],
      'correta': 'Jorge Horacio Messi',
      'imagem': 'assets/images/messi3.jpg',
    },
    {
      'texto': 'Qual o nome da sua mãe?',
      'respostas': [
        'Nadine Gonçalves',
        'Fayza Lamari',
        'Maria Dolores dos Santos Aveiro',
        'Celia María Cuccittini'
      ],
      'correta': 'Celia María Cuccittini',
      'imagem': 'assets/images/messi4.jpg',
    },
    {
      'texto': 'Qual a profissão ele desejou seguir?',
      'respostas': [
        'Tenista',
        'Personal Trainer',
        'Jogador de Futebol',
        'Engenheiro'
      ],
      'correta': 'Jogador de Futebol',
      'imagem': 'assets/images/messi5.jpg',
    },
  ];

  // Função para reiniciar o jogo caso a resposta esteja errada.
  void responder(String respostaSelecionada) {
    if (respostaSelecionada != perguntas[perguntaSelecionada]['correta']) {
      setState(() {
        perguntaSelecionada = 0;  // Reinicia o jogo
        pontuacaoTotal = 0;  // Reseta a pontuação
      });
    } else {
      setState(() {
        pontuacaoTotal++;  // Incrementa a pontuação
        perguntaSelecionada++;  // Avança para a próxima pergunta
      });
    }
  }

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Minha Vida'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: perguntas,
                perguntaSelecionada: perguntaSelecionada,
                responder: responder,
              )
            : Resultado(pontuacaoTotal),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  PerguntaAppState createState() {
    return PerguntaAppState();
  }
}
