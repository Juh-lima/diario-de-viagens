import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diario_de_viagens/screens/home.dart';
import 'package:flutter/material.dart';
import 'trip_info.dart'; // Certifique-se de importar a tela TripInfoScreen

class TripDetailScreen extends StatelessWidget {
  void _goToTripInfo(BuildContext context, Map<String, dynamic> trip) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            TripInfoScreen(trip: trip), // Mantenha Map<String, dynamic>
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
              child: StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection('trips').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(child: Text('Erro: ${snapshot.error}'));
                  }

                  final trips = snapshot.data!.docs
                      .map((doc) => {
                            'name': doc[
                                'description'], // ajuste conforme necessário
                            'description': doc[
                                'destination'], // ajuste conforme necessário
                            'image':
                                doc['imageUrl'], // ajuste conforme necessário
                          })
                      .toList();

                  return ListView.builder(
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
                  );
                },
              ),
            ),
            // Botão de retorno para a HomeScreen
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home'); // Navegar para o mapa
              },
              child: Text('Voltar para Home'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(150, 40),
                backgroundColor: Colors.white, // Cor do fundo do botão
                foregroundColor: Colors.blueAccent, // Cor do texto
              ),
            ),
          ],
        ),
      ),
    );
  }
}
