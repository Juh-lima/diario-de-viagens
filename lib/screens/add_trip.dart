// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class AddTripScreen extends StatefulWidget {
//   const AddTripScreen({super.key});

//   @override
//   _AddTripScreenState createState() => _AddTripScreenState();
// }

// class _AddTripScreenState extends State<AddTripScreen> {
//   final _titleController = TextEditingController();
//   final _descriptionController = TextEditingController();
//   String? _imagePath;

//   Future<void> _pickImage() async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.getImage(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       setState(() {
//         _imagePath = pickedFile.path; // Salva o caminho da imagem
//       });
//     }
//   }

//   void _saveTrip() {
//     // Aqui você pode adicionar a lógica para salvar a viagem

//     // Após salvar, retorna para a tela inicial
//     Navigator.pop(context); // Retorna para a tela anterior (HomeScreen)
//   }

//   void _goBack() {
//     Navigator.pop(context); // Função para voltar à tela anterior
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blueAccent, // Cor do AppBar
//         title: const Text(
//           'Adicionar Nova Viagem',
//           style: TextStyle(
//             color: Colors.white, // Cor do texto do AppBar
//           ),
//         ), // Apenas o título
//         automaticallyImplyLeading: false, // Remove o botão de voltar padrão
//       ),
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
//           children: [
//             TextField(
//               controller: _titleController,
//               style: const TextStyle(color: Colors.white),
//               decoration: const InputDecoration(
//                 labelText: 'Título da Viagem',
//                 labelStyle: TextStyle(color: Colors.white),
//                 enabledBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(color: Colors.white),
//                 ),
//                 focusedBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(color: Colors.white),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             TextField(
//               controller: _descriptionController,
//               style: const TextStyle(color: Colors.white),
//               decoration: const InputDecoration(
//                 labelText: 'Descrição',
//                 labelStyle: TextStyle(color: Colors.white),
//                 enabledBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(color: Colors.white),
//                 ),
//                 focusedBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(color: Colors.white),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             GestureDetector(
//               onTap: _pickImage,
//               child: Container(
//                 width: double.infinity,
//                 height: 200,
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.white),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: _imagePath == null
//                     ? const Center(
//                         child: Text(
//                           'Toque aqui para adicionar uma imagem',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       )
//                     : Image.file(
//                         File(_imagePath!),
//                         fit: BoxFit.cover,
//                       ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _saveTrip, // Chama a função para salvar a viagem
//               style: ElevatedButton.styleFrom(
//                 minimumSize: const Size(150, 40), // Tamanho mínimo do botão
//                 backgroundColor: Colors.white, // Cor do fundo do botão
//                 foregroundColor: Colors.blueAccent, // Cor do texto
//               ),
//               child: const Text('Salvar Viagem'),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _goBack, // Chama a função para voltar
//               style: ElevatedButton.styleFrom(
//                 minimumSize: const Size(150, 40), // Tamanho mínimo do botão
//                 backgroundColor: Colors.white, // Cor do fundo do botão
//                 foregroundColor: Colors.blueAccent, // Cor do texto
//               ),
//               child: const Text('Voltar para Home'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:diario_de_viagens/services/auth_service.dart';
import 'package:diario_de_viagens/services/storage_service.dart';
import 'package:diario_de_viagens/services/trip_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class AddTripScreen extends StatefulWidget {
  @override
  _AddTripScreenState createState() => _AddTripScreenState();
}

class _AddTripScreenState extends State<AddTripScreen> {
  final _destinationController = TextEditingController();
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();
  final _descriptionController =
      TextEditingController(); // Controlador para a descrição
  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _saveTrip() async {
    String destination = _destinationController.text;
    String startDate = _startDateController.text;
    String endDate = _endDateController.text;
    String description = _descriptionController.text; // Obtém a descrição

    // Verifica se todos os campos estão preenchidos
    if (destination.isEmpty ||
        startDate.isEmpty ||
        endDate.isEmpty ||
        description.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Por favor, preencha todos os campos!'),
        ),
      );
      return; // Retorna se algum campo estiver vazio
    }

    try {
      // Obtém o ID do usuário autenticado
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw Exception('Usuário não autenticado');
      }

      // Armazenar a imagem no Cloud Storage
      String? imageUrl;
      if (_image != null) {
        imageUrl = await StorageService().uploadImage(_image!);
      }

      // Chama o serviço para adicionar a viagem
      await TripService().addTrip(
        userId: user.uid,
        destination: destination,
        startDate: startDate,
        endDate: endDate,
        description: description, // Passa a descrição da viagem
        imageUrl: imageUrl, // Passa a URL da imagem, se houver
      );

      // Exibe uma mensagem de sucesso
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Viagem adicionada com sucesso!'),
        ),
      );

      // Limpa os campos após o salvamento
      _destinationController.clear();
      _startDateController.clear();
      _endDateController.clear();
      _descriptionController.clear(); // Limpa o campo de descrição
      setState(() {
        _image = null;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro ao adicionar viagem: $e'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Viagem',
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center, // Centraliza os botões
          children: [
            TextField(
              controller: _destinationController,
              decoration: InputDecoration(
                labelText: 'Destino',
                prefixIcon: Icon(Icons.location_on),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _descriptionController, // Campo para descrição
              decoration: InputDecoration(
                labelText: 'Descrição',
                prefixIcon: Icon(Icons.description),
                border: OutlineInputBorder(),
              ),
              maxLines: 1, // Permite várias linhas
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _startDateController,
              decoration: InputDecoration(
                labelText: 'Data de Início (AAAA-MM-DD)',
                prefixIcon: Icon(Icons.calendar_today),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _endDateController,
              decoration: InputDecoration(
                labelText: 'Data de Fim (AAAA-MM-DD)',
                prefixIcon: Icon(Icons.calendar_today),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Selecionar Imagem'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(120, 36), // Tamanho reduzido
                backgroundColor: Colors.white,
                foregroundColor: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 20),
            if (_image != null) // Exibe a imagem selecionada
              Image.file(
                _image!,
                height: 200,
                fit: BoxFit.cover,
              ),
            SizedBox(height: 40.0),
            ElevatedButton(
              onPressed: _saveTrip,
              child: Text('Salvar Viagem'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(120, 36), // Tamanho reduzido
                backgroundColor: Colors.white,
                foregroundColor: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Volta para a tela anterior
              },
              child: Text('Voltar para Home'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(120, 36), // Tamanho reduzido
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
