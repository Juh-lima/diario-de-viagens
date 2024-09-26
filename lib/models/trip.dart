class Trip {
  final String id;
  final String userId;
  final String name;
  final String description;
  final DateTime startDate;
  final DateTime endDate;
  final List<String> locations; // IDs ou nomes dos locais

  Trip({
    required this.id,
    required this.userId,
    required this.name,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.locations,
  });

  // Método para converter de Map para Trip
  factory Trip.fromMap(Map<String, dynamic> data) {
    return Trip(
      id: data['id'] ?? '',
      userId: data['userId'] ?? '',
      name: data['name'] ?? '',
      description: data['description'] ?? '',
      startDate: DateTime.parse(data['startDate']),
      endDate: DateTime.parse(data['endDate']),
      locations: List<String>.from(data['locations'] ?? []),
    );
  }

  // Método para converter de Trip para Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'name': name,
      'description': description,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'locations': locations,
    };
  }
}
