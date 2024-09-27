// import 'dart:io';
// import 'package:firebase_storage/firebase_storage.dart';

// class StorageService {
//   final FirebaseStorage _storage = FirebaseStorage.instance;

//   Future<String> uploadImage(String imagePath) async {
//     try {
//       File file = File(imagePath);
//       String fileName = DateTime.now()
//           .millisecondsSinceEpoch
//           .toString(); // Gera um nome único para o arquivo

//       // Faz o upload do arquivo para o Firebase Storage
//       TaskSnapshot snapshot =
//           await _storage.ref('images/$fileName').putFile(file);

//       // Obtém a URL de download do arquivo
//       String downloadUrl = await snapshot.ref.getDownloadURL();
//       return downloadUrl;
//     } catch (e) {
//       print('Erro ao fazer upload da imagem: $e');
//       throw e; // Lança a exceção para ser tratada no método que chamou
//     }
//   }
// }

import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadImage(File imageFile) async {
    try {
      // Gera um nome único para o arquivo
      String fileName =
          DateTime.now().millisecondsSinceEpoch.toString() + '.jpg';

      // Referência ao local onde o arquivo será armazenado
      Reference ref = _storage.ref().child('images/$fileName');

      // Faz o upload do arquivo
      await ref.putFile(imageFile);

      // Obtém a URL do arquivo após o upload
      String downloadUrl = await ref.getDownloadURL();

      return downloadUrl; // Retorna a URL do arquivo
    } catch (e) {
      throw Exception('Erro ao fazer upload da imagem: $e');
    }
  }
}
