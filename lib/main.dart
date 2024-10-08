import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/add_trip.dart';
import 'screens/login.dart';
import 'screens/trip_detail.dart';
import 'screens/cadastro.dart'; // Adicionando a nova tela de cadastro
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicialize o Firebase com as opções para diferentes plataformas
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  //await FirebaseAuth.instance.setPersistence(Persistence.LOCAL);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diário de Viagens',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false, // Remove a listrinha de debug
      initialRoute: '/login', // Iniciar na tela de login
      routes: {
        '/home': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) =>
            SignupScreen(), // Nova rota para a tela de cadastro
        '/add_trip': (context) => AddTripScreen(),
        '/trip_detail': (context) => TripDetailScreen(),
      },
    );
  }
}
