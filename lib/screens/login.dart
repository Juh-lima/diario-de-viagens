import 'package:diario_de_viagens/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();

//   // Função de login com redirecionamento para a HomeScreen
//   Future<void> _login() async {
//     String email = _emailController.text;
//     String password = _passwordController.text;

//     try {
//       // Chama o método de login do AuthService
//       await AuthService()
//           .signin(email: email, password: password, context: context);
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//             content: Text(
//           'Logado com sucesso!',
//           style: TextStyle(color: Colors.lightGreen),
//         )),
//       );
//       // Se o login for bem-sucedido, redireciona para a tela Home
//       Navigator.pushReplacementNamed(context, '/home');
//     } catch (e) {
//       // Exibe uma mensagem de erro em caso de falha no login
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Erro ao fazer login: $e')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.blueAccent, Colors.lightBlueAccent],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             // Adiciona a imagem no topo
//             Image.asset(
//               'assets/icon/icone-app.png',
//               height: 150,
//             ),
//             Text(
//               'Diário de Viagens',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white, // Cor do texto
//               ),
//               textAlign: TextAlign.center,
//             ),

//             const SizedBox(height: 60),

//             TextField(
//               controller: _emailController,
//               decoration: const InputDecoration(
//                 labelText: 'E-mail',
//                 prefixIcon: Icon(Icons.email, color: Colors.white),
//                 labelStyle: TextStyle(color: Colors.white),
//                 enabledBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(color: Colors.white),
//                 ),
//                 focusedBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(color: Colors.white),
//                 ),
//               ),
//               style: const TextStyle(color: Colors.white),
//             ),
//             const SizedBox(height: 20),
//             TextField(
//               controller: _passwordController,
//               decoration: const InputDecoration(
//                 labelText: 'Senha',
//                 prefixIcon: Icon(Icons.lock, color: Colors.white),
//                 labelStyle: TextStyle(color: Colors.white),
//                 enabledBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(color: Colors.white),
//                 ),
//                 focusedBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(color: Colors.white),
//                 ),
//               ),
//               obscureText: true,
//               style: const TextStyle(color: Colors.white),
//             ),
//             const SizedBox(height: 20),
//             Center(
//               child: ElevatedButton(
//                 onPressed: _login, // Chama a função de login ao clicar
//                 child: const Text('Entrar'),
//                 style: ElevatedButton.styleFrom(
//                   minimumSize: const Size(150, 40),
//                   backgroundColor: Colors.white,
//                   foregroundColor: Colors.blueAccent,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             TextButton(
//               onPressed: () {
//                 Navigator.pushNamed(context, '/signup');
//               },
//               child: const Text(
//                 'Ainda não tem uma conta? Cadastre-se',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // Chave para o formulário

  // Método para login do usuário
  Future<void> _loginUser() async {
    if (_formKey.currentState!.validate()) {
      try {
        // Autentica o usuário com FirebaseAuth
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );

        // Redireciona para a home após login bem-sucedido
        Navigator.of(context).pushReplacementNamed('/home');
      } catch (e) {
        // Exibe um erro se o login falhar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro de login: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login',
            style: TextStyle(
              color: Colors.white, // Cor do texto do AppBar
            )),
        backgroundColor: Colors.blueAccent,
        automaticallyImplyLeading: false,
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
        child: Form(
          key: _formKey, // Usa a chave do formulário para validação
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:
                CrossAxisAlignment.center, // Centraliza os itens
            children: <Widget>[
              // Adiciona a imagem no topo
              Image.asset(
                'assets/icon/icone-app.png',
                height: 150,
              ),
              Text(
                'Diário de Viagens',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Cor do texto
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 60),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'E-mail'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu e-mail';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Senha'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira sua senha';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              // Centraliza o botão de login
              SizedBox(
                width: 150, // Define a largura do botão
                child: ElevatedButton(
                  onPressed: _loginUser,
                  child: Text('Entrar'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(150, 40),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blueAccent,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: const Text(
                  'Ainda não tem uma conta? Cadastre-se',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
