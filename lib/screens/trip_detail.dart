import 'package:diario_de_viagens/screens/home.dart';
import 'package:flutter/material.dart';
import 'trip_info.dart'; // Certifique-se de importar a tela TripInfoScreen

class TripDetailScreen extends StatelessWidget {
  final List<Map<String, String>> trips = [
    {
      'name': 'Viagem à Praia',
      'description': 'Uma viagem relaxante à beira-mar!',
      'image': 'url_da_imagem_1' // Substitua com a URL ou caminho da imagem
    },
    {
      'name': 'Viagem à Montanha',
      'description': 'Uma aventura nas montanhas!',
      'image': 'url_da_imagem_2' // Substitua com a URL ou caminho da imagem
    },
    // Adicione mais viagens conforme necessário
  ];

  void _goToTripInfo(BuildContext context, Map<String, String> trip) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TripInfoScreen(trip: trip),
      ),
    );
  }

  void _goToHome(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
          builder: (context) =>
              HomeScreen()), // Certifique-se de importar a tela HomeScreen
      (Route<dynamic> route) => false, // Remove todas as rotas anteriores
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'Detalhes das Viagens',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: trips.length,
                itemBuilder: (context, index) {
                  final trip = trips[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      title: Text(trip['name']!),
                      subtitle: Text(trip['description']!),
                      trailing: ElevatedButton(
                        onPressed: () => _goToTripInfo(context, trip),
                        child: const Text('Mais Detalhes'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () => _goToHome(context), // Volta para a tela inicial
              child: const Text('Voltar para Home'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.blueAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
