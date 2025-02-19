import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var perguntaSelecionada = 0;

  void responder() {
    setState(() {
      perguntaSelecionada++;
    });
    print(perguntaSelecionada);
  }

  @override
  Widget build(BuildContext context) {
    final List<String> perguntas = [
      'Qual a sua cor favorita?',
      'Qual o seu animal favorito?',
      'Qual time de futebol você torce?',
      'Qual sua linguagem de programação favorita?',
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Perguntas')),
        body: Column(
          children: [
            Text(perguntas[perguntaSelecionada]),
            ElevatedButton(
              child: const Text('Resposta 1'),
              onPressed: () {
                responder();
              },
            ),
            ElevatedButton(
              child: const Text('Resposta 2'),
              onPressed: () {
                responder();
              },
            ),
            ElevatedButton(
              child: const Text('Resposta 3'),
              onPressed: () {
                responder();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}
