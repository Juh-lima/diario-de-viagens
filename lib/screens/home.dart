// import 'package:diario_de_viagens/services/auth_service.dart';
// import 'package:flutter/material.dart';

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Diário de Viagens',
//           style: TextStyle(
//             color: Colors.white, // Cor do texto do AppBar
//           ),
//         ),
//         backgroundColor: Colors.blueAccent, // Cor de fundo do AppBar
//         automaticallyImplyLeading: false, // Remove a seta de voltar
//         actions: [
//           IconButton(
//             icon: Icon(Icons.exit_to_app, color: Colors.white), // Ícone branco
//             onPressed: () async {
//               await AuthService().signout(context: context);
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(
//                     content: Text(
//                   'Sessão encerrada!',
//                   style: TextStyle(color: Colors.lightGreen),
//                 )),
//               );
//               Navigator.pushReplacementNamed(
//                   context, '/login'); // Navegar para tela de login
//             },
//           ),
//         ],
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.blueAccent, Colors.lightBlueAccent],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         padding: const EdgeInsets.all(16.0),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text(
//                 'Bem-vindo ao seu Diário de Viagens!',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white, // Cor do texto
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushNamed(
//                       context, '/add_trip'); // Navegar para adicionar viagem
//                 },
//                 child: Text('Adicionar Nova Viagem'),
//                 style: ElevatedButton.styleFrom(
//                   minimumSize: Size(150, 40),
//                   backgroundColor: Colors.white, // Cor do fundo do botão
//                   foregroundColor: Colors.blueAccent, // Cor do texto
//                 ),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context,
//                       '/trip_detail'); // Navegar para detalhes da viagem
//                 },
//                 child: Text('Viagens Salvas'),
//                 style: ElevatedButton.styleFrom(
//                   minimumSize: Size(150, 40),
//                   backgroundColor: Colors.white, // Cor do fundo do botão
//                   foregroundColor: Colors.blueAccent, // Cor do texto
//                 ),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/map'); // Navegar para o mapa
//                 },
//                 child: Text('Abrir Mapa'),
//                 style: ElevatedButton.styleFrom(
//                   minimumSize: Size(150, 40),
//                   backgroundColor: Colors.white, // Cor do fundo do botão
//                   foregroundColor: Colors.blueAccent, // Cor do texto
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:diario_de_viagens/services/auth_service.dart';
import 'package:diario_de_viagens/screens/add_trip.dart'; // Importa a tela de adicionar viagem
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
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
        automaticallyImplyLeading: false, // Remove a seta de voltar
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app, color: Colors.white), // Ícone branco
            onPressed: () async {
              await AuthService().signout(context: context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Sessão encerrada!',
                    style: TextStyle(color: Colors.lightGreen),
                  ),
                ),
              );
              //Navigator.pushReplacementNamed(
              //   context, '/login'); // Navegar para tela de login
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Bem-vindo ao seu Diário de Viagens!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Cor do texto
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddTripScreen()),
                  ); // Navegar para adicionar viagem
                },
                child: Text('Adicionar Nova Viagem'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(150, 40),
                  backgroundColor: Colors.white, // Cor do fundo do botão
                  foregroundColor: Colors.blueAccent, // Cor do texto
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context,
                      '/trip_detail'); // Navegar para detalhes da viagem
                },
                child: Text('Viagens Salvas'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(150, 40),
                  backgroundColor: Colors.white, // Cor do fundo do botão
                  foregroundColor: Colors.blueAccent, // Cor do texto
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/map'); // Navegar para o mapa
                },
                child: Text('Abrir Mapa'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(150, 40),
                  backgroundColor: Colors.white, // Cor do fundo do botão
                  foregroundColor: Colors.blueAccent, // Cor do texto
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
