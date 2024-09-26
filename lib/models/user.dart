class User {
  final String id;
  final String name;
  final String email;
  final String profileImageUrl;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.profileImageUrl = '',
  });

  // Método para converter de Map para User
  factory User.fromMap(Map<String, dynamic> data) {
    return User(
      id: data['id'] ?? '',
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      profileImageUrl: data['profileImageUrl'] ?? '',
    );
  }

  // Método para converter de User para Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'profileImageUrl': profileImageUrl,
    };
  }
}
