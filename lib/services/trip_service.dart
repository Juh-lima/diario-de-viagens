// import 'package:cloud_firestore/cloud_firestore.dart';

// class TripService {
//   final FirebaseFirestore _db = FirebaseFirestore.instance;

//   // Adicionar nova viagem
//   Future<void> addTrip(String userId, Map<String, dynamic> tripData) async {
//     await _db.collection('users').doc(userId).collection('trips').add(tripData);
//   }

//   // Obter viagens salvas
//   Stream<List<Map<String, dynamic>>> getTrips(String userId) {
//     return _db
//         .collection('users')
//         .doc(userId)
//         .collection('trips')
//         .snapshots()
//         .map(
//       (snapshot) {
//         return snapshot.docs
//             .map((doc) => doc.data() as Map<String, dynamic>)
//             .toList();
//       },
//     );
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';

// class TripService {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future<void> addTrip({
//     required String userId,
//     required String destination,
//     required String startDate,
//     required String endDate,
//   }) async {
//     await _firestore.collection('trips').add({
//       'userId': userId,
//       'destination': destination,
//       'startDate': startDate,
//       'endDate': endDate,
//       'createdAt': FieldValue.serverTimestamp(), // Data de criação
//     });
//   }
// }
// import 'package:cloud_firestore/cloud_firestore.dart';

// class TripService {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future<void> addTrip(
//       {required String userId,
//       required String destination,
//       //required String startDate,
//       //required String endDate,
//       required String description,
//       required String? imageUrl}) async {
//     await _firestore.collection('trips').add({
//       'userId': userId,
//       'destination': destination,
//       'createdAt': FieldValue.serverTimestamp(), // Data de criação
//     });
//   }
// }
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class TripService {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future<List<Map<String, dynamic>>> getTrips() async {
//     User? user = FirebaseAuth.instance.currentUser;
//     if (user == null) {
//       throw Exception('Usuário não autenticado');
//     }

//     try {
//       QuerySnapshot snapshot = await _firestore
//           .collection('trips') // Certifique-se de que a coleção está correta
//           .where('userId', isEqualTo: user.uid) // Filtra viagens do usuário autenticado
//           .get();

//       return snapshot.docs.map((doc) {
//         return {
//           'name': doc['destination'], // Supondo que você tem um campo 'destination'
//           'description': doc['description'], // Supondo que você tem um campo 'description'
//           'image': doc['imageUrl'], // Supondo que você tem um campo 'imageUrl'
//         };
//       }).toList();
//     } catch (e) {
//       throw Exception('Erro ao buscar viagens: $e');
//     }
//   }
// trip_service.dart
// trip_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class TripService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addTrip({
    required String userId,
    required String destination,
    // required String startDate,
    // required String endDate,
    required String description,
    String? imageUrl,
  }) async {
    try {
      await _db.collection('trips').add({
        'userId': userId,
        'destination': destination,
        // 'startDate': startDate,
        // 'endDate': endDate,
        'description': description,
        'imageUrl': imageUrl, // URL da imagem, se houver
      });
    } catch (e) {
      print('Erro ao adicionar viagem: $e');
      throw e; // Propaga o erro para que possa ser tratado em outro lugar
    }
  }

  Future<List<Map<String, String>>> getTrips() async {
    try {
      final snapshot = await _db.collection('trips').get();
      return snapshot.docs.map((doc) {
        return {
          'destination': doc['destination']
              as String, // Certifique-se de que isso seja uma String
          'description': doc['description']
              as String, // Certifique-se de que isso seja uma String
          'image': doc['imageUrl']
              as String, // Certifique-se de que isso seja uma String
        };
      }).toList();
    } catch (e) {
      print('Erro ao obter viagens: $e');
      return [];
    }
  }
}


  // Outros métodos do TripService podem ser aqui


