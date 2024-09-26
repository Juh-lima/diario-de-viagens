import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    // Aqui você pode adicionar a lógica de autenticação
    Navigator.pushReplacementNamed(
        context, '/'); // Navegar para HomeScreen após login
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blueAccent,
              Colors.lightBlueAccent
            ], // Gradiente de cores
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Adiciona a imagem no topo
            Image.asset(
              'assets/icon/icone-app.png', // Caminho da imagem (adicionar a imagem em assets)
              height: 150, // Altura da imagem
            ),
            const SizedBox(
                height: 60), // Espaço maior entre a imagem e o formulário
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'E-mail',
                prefixIcon:
                    Icon(Icons.email, color: Colors.white), // Ícone de e-mail
                labelStyle:
                    TextStyle(color: Colors.white), // Cor do texto do rótulo
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white), // Borda do campo
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white), // Borda ao focar
                ),
              ),
              style: const TextStyle(color: Colors.white), // Cor do texto
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Senha',
                prefixIcon:
                    Icon(Icons.lock, color: Colors.white), // Ícone de senha
                labelStyle:
                    TextStyle(color: Colors.white), // Cor do texto do rótulo
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white), // Borda do campo
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white), // Borda ao focar
                ),
              ),
              obscureText: true,
              style: const TextStyle(color: Colors.white), // Cor do texto
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(150, 40), // Tamanho mínimo do botão
                  backgroundColor: Colors.white, // Cor de fundo do botão
                  foregroundColor: Colors.blueAccent, // Cor do texto do botão
                ),
                child: Text('Entrar'),
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, '/signup'); // Navegar para a tela de cadastro
              },
              child: const Text(
                'Ainda não tem uma conta? Cadastre-se',
                style: TextStyle(color: Colors.white), // Cor do texto do botão
              ),
            ),
          ],
        ),
      ),
    );
  }
}
