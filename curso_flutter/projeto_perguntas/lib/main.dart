import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';
import 'package:projeto_perguntas/resultado.dart';
import 'package:projeto_perguntas/questionario.dart';
 
void main() => runApp(const PerguntaApp());
 
class PerguntaAppState extends State<PerguntaApp> {
  var perguntaSelecionada = 0;
  final List<Map<String, Object>> perguntas = const[
      {
        'texto': 'Qual é a sua cor favorita?',
        'respostas': ['Preto', 'Vermelho', 'Verde', 'Branco'],
      },
      {
        'texto': 'Qual é o seu animal favorito?',
        'respostas': ['Coelho', 'Cobra', 'Elefante', 'Leão'],
      },
      {
        'texto': 'Qual é o seu instrutor favorito?',
        'respostas': ['Maria', 'João', 'Leo', 'Beto'],
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
    
    List<String> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada]['respostas'] as List<String>
        : [];
 
    //for (String textoResp in perguntas[perguntaSelecionada]['respostas'] as List<String>) {
    //respostas.add(Resposta(textoResp, responder));
    //}
 
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: 
        temPerguntaSelecionada ? 
            Questionario(perguntas: perguntas,
            perguntaSelecionada: perguntaSelecionada,
            responder: responder)
            : Resultado(),
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
