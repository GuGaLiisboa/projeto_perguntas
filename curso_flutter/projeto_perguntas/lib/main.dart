import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';
import 'package:projeto_perguntas/resultado.dart';
import 'package:projeto_perguntas/questionario.dart';
 
void main() => runApp(const PerguntaApp());
 
class PerguntaAppState extends State<PerguntaApp> {
  var perguntaSelecionada = 0;
  final List<Map<String, Object>> perguntas = const [
  {
    'texto': 'Qual jogo ficou famoso pelo personagem Mario, que é um encanador?',
    'respostas': ['Sonic the Hedgehog', 'The Legend of Zelda', 'Super Mario Bros.', 'Donkey Kong'],
    'imagem': 'assets/images/mario.png',  // Adicionando a imagem para a pergunta
  },
  {
    'texto': 'Qual foi o primeiro jogo da série "Grand Theft Auto" lançado para PlayStation 2?',
    'respostas': ['GTA San Andreas', 'GTA III', 'GTA Vice City', 'GTA Liberty City Stories'],
    'imagem': 'assets/images/cj.png',  // Outra imagem para essa pergunta
  },
  {
    'texto': 'Quem é o criador do jogo "Minecraft"?',
    'respostas': ['Markus Persson (Notch)', 'Shigeru Miyamoto', 'Hideo Kojima', 'Beto'],
    'imagem': 'assets/images/steve.png',  // Outra imagem para essa pergunta
  },
];
 
 
  void responder() {
    setState(() {
      perguntaSelecionada++;
    });
    print(perguntaSelecionada);    
  }
 
  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }
 
  @override
Widget build(BuildContext context) {
  // Obtendo as respostas para a pergunta atual
  List<String> respostas = temPerguntaSelecionada
      ? perguntas[perguntaSelecionada]['respostas'] as List<String>
      : [];

  // Obtendo a imagem da pergunta atual
  String imagemAtual = temPerguntaSelecionada
      ? perguntas[perguntaSelecionada]['imagem'] as String
      : '';

  return MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Perguntas'),
      ),
      body: Column(
        children: [
          // Carregar a imagem da pergunta atual
          if (imagemAtual.isNotEmpty) 
            Image.asset(
              imagemAtual,
              width: 200,
              height: 200,
            ),
          // Carregar o questionário ou o resultado
          temPerguntaSelecionada
              ? Questionario(
                  perguntas: perguntas,
                  perguntaSelecionada: perguntaSelecionada,
                  responder: responder,
                )
              : Resultado(),
        ],
      ),
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
