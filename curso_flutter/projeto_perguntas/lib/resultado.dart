import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacaoTotal;

  // Variáveis fixas para nome e profissão
  final String nomeCompleto = "Lionel Andrés Messi Cuccittini";  // Substitua pelo nome real
  final String profissaoSonhos = "Jogador de Futebol";   // Substitua pela profissão real

  const Resultado(this.pontuacaoTotal, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Parabéns, caro $profissaoSonhos $nomeCompleto, você concluiu o jogo!",
            style: const TextStyle(fontSize: 28),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            "Sua pontuação: $pontuacaoTotal",
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
