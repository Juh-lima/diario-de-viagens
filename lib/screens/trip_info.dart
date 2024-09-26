import 'package:flutter/material.dart';

class TripInfoScreen extends StatelessWidget {
  final Map<String, String> trip;

  TripInfoScreen({required this.trip});

  void _goBack(BuildContext context) {
    Navigator.pop(context); // Volta para a tela anterior
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'Informações da Viagem',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        automaticallyImplyLeading: false, // Remove a seta de voltar padrão
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Center(
          // Usar Center para centralizar os elementos
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:
                CrossAxisAlignment.center, // Centraliza na horizontal
            children: <Widget>[
              Text(
                'Nome: ${trip['name']}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Descrição: ${trip['description']}',
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              // Aqui você pode adicionar a imagem
              trip['image'] != null
                  ? Image.network(
                      trip['image']!,
                      height: 200,
                      fit: BoxFit.cover,
                    )
                  : const Text(
                      'Imagem não disponível',
                      style: TextStyle(color: Colors.white),
                    ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () =>
                    _goBack(context), // Voltar para a tela anterior
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(150, 40),
                  backgroundColor: Colors.white, // Cor do fundo do botão
                  foregroundColor: Colors.blueAccent, // Cor do texto
                ),
                child: const Text('Voltar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
