import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final VoidCallback quandoSelecionado;

  const Resposta({
    required this.texto,
    required this.quandoSelecionado,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 500),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 122, 213, 83),
          foregroundColor: const Color.fromARGB(255, 0, 0, 0),
          elevation: 5,
        ),
        onPressed: quandoSelecionado,
        child: Text(
          texto,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
