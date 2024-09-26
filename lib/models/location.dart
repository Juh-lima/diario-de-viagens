class Location {
  final String id;
  final String tripId;
  final String name;
  final double latitude;
  final double longitude;
  final String notes;
  final String imageUrl;

  Location({
    required this.id,
    required this.tripId,
    required this.name,
    required this.latitude,
    required this.longitude,
    this.notes = '',
    this.imageUrl = '',
  });

  // Método para converter de Map para Location
  factory Location.fromMap(Map<String, dynamic> data) {
    return Location(
      id: data['id'] ?? '',
      tripId: data['tripId'] ?? '',
      name: data['name'] ?? '',
      latitude: data['latitude']?.toDouble() ?? 0.0,
      longitude: data['longitude']?.toDouble() ?? 0.0,
      notes: data['notes'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
    );
  }

  // Método para converter de Location para Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'tripId': tripId,
      'name': name,
      'latitude': latitude,
      'longitude': longitude,
      'notes': notes,
      'imageUrl': imageUrl,
    };
  }
}
