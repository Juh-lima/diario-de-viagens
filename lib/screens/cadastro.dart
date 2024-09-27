// import 'package:diario_de_viagens/services/auth_service.dart';
// import 'package:flutter/material.dart';

// class SignupScreen extends StatefulWidget {
//   @override
//   _SignupScreenState createState() => _SignupScreenState();
// }

// class _SignupScreenState extends State<SignupScreen> {
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _confirmPasswordController = TextEditingController();

//   void _goBackToLogin() {
//     Navigator.pushReplacementNamed(
//         context, '/login'); // Vai para a tela de login
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Cadastro', style: TextStyle(color: Colors.white)),
//         backgroundColor: Colors.blueAccent,
//         automaticallyImplyLeading: false, // Retira a seta de retorno
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
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextField(
//               controller: _emailController,
//               decoration: InputDecoration(
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
//               style: TextStyle(color: Colors.white),
//             ),
//             SizedBox(height: 20),
//             TextField(
//               controller: _passwordController,
//               decoration: InputDecoration(
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
//               style: TextStyle(color: Colors.white),
//             ),
//             SizedBox(height: 20),
//             TextField(
//               controller: _confirmPasswordController,
//               decoration: InputDecoration(
//                 labelText: 'Confirmar Senha',
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
//               style: TextStyle(color: Colors.white),
//             ),
//             SizedBox(height: 40),
//             Center(
//               child: ElevatedButton(
//                 onPressed: () async {
//                   String email = _emailController.text;
//                   String password = _passwordController.text;
//                   String confirmPassword = _confirmPasswordController.text;

//                   // Verifica se as senhas coincidem
//                   if (password != confirmPassword) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(content: Text('As senhas não coincidem!')),
//                     );
//                     return;
//                   }

//                   try {
//                     // Chama o serviço de autenticação para realizar o cadastro
//                     await AuthService().signup(
//                       email: email,
//                       password: password,
//                       confirmPassword: confirmPassword,
//                     );

//                     // Exibe uma mensagem de sucesso
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                           content: Text(
//                         'Cadastro realizado com sucesso!',
//                         style: TextStyle(color: Colors.lightGreen),
//                       )),
//                     );

//                     // Após o sucesso no signup, redireciona para a tela de login
//                     Navigator.pushReplacementNamed(context, '/login');
//                   } catch (e) {
//                     // Exibe um erro caso ocorra
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(content: Text('Erro ao realizar cadastro: $e')),
//                     );
//                   }
//                 },
//                 child: Text('Cadastrar'),
//                 style: ElevatedButton.styleFrom(
//                   minimumSize: Size(150, 40),
//                   backgroundColor: Colors.white,
//                   foregroundColor: Colors.blueAccent,
//                 ),
//               ),
//             ),
//             SizedBox(height: 20), // Espaço entre os botões
//             Center(
//               child: ElevatedButton(
//                 onPressed: _goBackToLogin, // Função para voltar para login
//                 child: Text('Voltar para Login'),
//                 style: ElevatedButton.styleFrom(
//                   minimumSize: Size(150, 40),
//                   backgroundColor: Colors.white,
//                   foregroundColor: Colors.blueAccent,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:diario_de_viagens/services/auth_service.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // Chave para o formulário

  void _goBackToLogin() {
    Navigator.pushReplacementNamed(
        context, '/login'); // Redireciona para a tela de login
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro', style: TextStyle(color: Colors.white)),
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  prefixIcon: Icon(Icons.email, color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                style: TextStyle(color: Colors.white),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu e-mail';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  prefixIcon: Icon(Icons.lock, color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                obscureText: true,
                style: TextStyle(color: Colors.white),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira sua senha';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(
                  labelText: 'Confirmar Senha',
                  prefixIcon: Icon(Icons.lock, color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                obscureText: true,
                style: TextStyle(color: Colors.white),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, confirme sua senha';
                  } else if (value != _passwordController.text) {
                    return 'As senhas não coincidem!';
                  }
                  return null;
                },
              ),
              SizedBox(height: 40),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    // Valida o formulário
                    if (_formKey.currentState!.validate()) {
                      String email = _emailController.text;
                      String password = _passwordController.text;

                      try {
                        // Chama o serviço de autenticação para realizar o cadastro
                        await AuthService().signup(
                          email: email,
                          password: password,
                          confirmPassword:
                              password, // Não precisa passar confirmPassword
                        );

                        // Exibe uma mensagem de sucesso
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Cadastro realizado com sucesso!',
                                style: TextStyle(color: Colors.lightGreen)),
                          ),
                        );

                        // Após o sucesso no signup, redireciona para a tela de login
                        Navigator.pushReplacementNamed(context, '/login');
                      } catch (e) {
                        // Exibe um erro caso ocorra
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('Erro ao realizar cadastro: $e')),
                        );
                      }
                    }
                  },
                  child: Text('Cadastrar'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(150, 40),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blueAccent,
                  ),
                ),
              ),
              SizedBox(height: 20), // Espaço entre os botões
              Center(
                child: ElevatedButton(
                  onPressed: _goBackToLogin, // Função para voltar para login
                  child: Text('Voltar para Login'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(150, 40),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blueAccent,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
