import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';

class Questionario extends StatelessWidget {
  final int perguntaSelecionada;
  final List<Map<String, Object>> perguntas;
  final void Function(String) responder;

  const Questionario({
    super.key,
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.responder,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    // Obter os dados da pergunta atual
    final perguntaAtual = perguntas[perguntaSelecionada];
    final textoPergunta = perguntaAtual['texto'] as String;
    final respostas = perguntaAtual['respostas'] as List<String>;
    final imagemPergunta = perguntaAtual['imagem'] as String;

    return Column(
      children: [
        // Exibe a imagem da pergunta
        Image.asset(
          imagemPergunta,
          width: 200,
          height: 250,
          fit: BoxFit.cover, // Ajusta o tamanho da imagem
        ),
        // Exibe a pergunta
        Questao(textoPergunta),

        // Exibe as respostas
        ...respostas.map((resposta) {
          return Resposta(
            texto: resposta,
            quandoSelecionado: () => responder(resposta),
          );
        }).toList(),
      ],
    );
  }
}
