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
import 'package:cloud_firestore/cloud_firestore.dart';

class TripService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addTrip(
      {required String userId,
      required String destination,
      required String startDate,
      required String endDate,
      required String description,
      required String? imageUrl}) async {
    await _firestore.collection('trips').add({
      'userId': userId,
      'destination': destination,
      'startDate': startDate,
      'endDate': endDate,
      'createdAt': FieldValue.serverTimestamp(), // Data de criação
    });
  }
}
