import 'package:flutter/material.dart';

class TripInfoScreen extends StatelessWidget {
  final Map<String, dynamic> trip;

  TripInfoScreen({required this.trip});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Diário de Viagens',
          style: TextStyle(
            color: Colors.white, // Cor do texto do AppBar
          ),
        ),
        backgroundColor: Colors.blueAccent, // Cor de fundo do AppBar
        automaticallyImplyLeading: false,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Exiba os detalhes da viagem aqui
                  Text(
                    trip['description'] ?? 'Sem descrição',
                    style: TextStyle(fontSize: 18),
                  ),
                  // Se você tiver uma imagem, pode usar o Image.network
                  if (trip['image'] != null) Image.network(trip['image']),
                ],
              ),
            ),
            // Botão de retorno para a TripDetailScreen
            SizedBox(
              width: double.infinity, // Ocupa toda a largura disponível
              child: ElevatedButton(
                onPressed: () =>
                    Navigator.pop(context), // Retorna para a tela anterior
                child: const Text('Voltar para Detalhes das Viagens'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.blueAccent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
