import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddTripScreen extends StatefulWidget {
  const AddTripScreen({super.key});

  @override
  _AddTripScreenState createState() => _AddTripScreenState();
}

class _AddTripScreenState extends State<AddTripScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  String? _imagePath;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imagePath = pickedFile.path; // Salva o caminho da imagem
      });
    }
  }

  void _saveTrip() {
    // Aqui você pode adicionar a lógica para salvar a viagem

    // Após salvar, retorna para a tela inicial
    Navigator.pop(context); // Retorna para a tela anterior (HomeScreen)
  }

  void _goBack() {
    Navigator.pop(context); // Função para voltar à tela anterior
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent, // Cor do AppBar
        title: const Text(
          'Adicionar Nova Viagem',
          style: TextStyle(
            color: Colors.white, // Cor do texto do AppBar
          ),
        ), // Apenas o título
        automaticallyImplyLeading: false, // Remove o botão de voltar padrão
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
            TextField(
              controller: _titleController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Título da Viagem',
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _descriptionController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Descrição',
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: _imagePath == null
                    ? const Center(
                        child: Text(
                          'Toque aqui para adicionar uma imagem',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    : Image.file(
                        File(_imagePath!),
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveTrip, // Chama a função para salvar a viagem
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(150, 40), // Tamanho mínimo do botão
                backgroundColor: Colors.white, // Cor do fundo do botão
                foregroundColor: Colors.blueAccent, // Cor do texto
              ),
              child: const Text('Salvar Viagem'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _goBack, // Chama a função para voltar
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(150, 40), // Tamanho mínimo do botão
                backgroundColor: Colors.white, // Cor do fundo do botão
                foregroundColor: Colors.blueAccent, // Cor do texto
              ),
              child: const Text('Voltar para Home'),
            ),
          ],
        ),
      ),
    );
  }
}
