import 'dart:convert';
import 'package:flutter_structure/core/constants/api_constant.dart';
import 'package:flutter_structure/features/auth/data/model/auth_model.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  // Login: ส่ง userId และ password ไปยัง API และรับ AuthModel กลับ
  Future<AuthModel> login(String userId, String password) async {
    final url = Uri.parse('${ApiConstant.baseUrl}/login');

    final response = await http
        .post(
          url,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({'userId': userId, 'password': password}),
        )
        .timeout(ApiConstant.timeout);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return AuthModel.fromJson(data);
    } else {
      throw Exception(
        'Login failed: ${response.statusCode} - ${response.body}',
      );
    }
  }

  // Fetch user info by userId
  Future<AuthModel> getUser(String userId) async {
    final url = Uri.parse('${ApiConstant.baseUrl}/users/$userId');

    final response = await http.get(url).timeout(ApiConstant.timeout);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return AuthModel.fromJson(data);
    } else {
      throw Exception('Get user failed: ${response.statusCode}');
    }
  }
}
