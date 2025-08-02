class AuthModel {
  final String userId;
  final String name;
  final String password;
  final String role;

  const AuthModel({
    required this.userId,
    required this.name,
    required this.password,
    required this.role,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      userId: json['userId'] as String,
      name: json['name'] as String,
      password: json['password'] as String,
      role: json['role'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'userId': userId, 'name': name, 'password': password, 'role': role};
  }

  //copyWith() ไว้ใช้แก้ไข object แบบไม่ต้องสร้างใหม่หมด
  AuthModel copyWith({
    String? userId,
    String? name,
    String? password,
    String? role,
  }) {
    return AuthModel(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      password: password ?? this.password,
      role: role ?? this.role,
    );
  }

  //Override == และ hashCode เอาไว้เปรียบเทียบ object
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthModel &&
          runtimeType == other.runtimeType &&
          userId == other.userId &&
          name == other.name &&
          password == other.password &&
          role == other.role;

  @override
  int get hashCode =>
      userId.hashCode ^ name.hashCode ^ password.hashCode ^ role.hashCode;
}
