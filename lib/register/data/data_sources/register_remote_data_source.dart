import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie/app%20constants.dart';
import '../models/register_model.dart';
class RegisterRemoteDataSource {
  Future<RegisterModel> registerUser({
    required String name,
    required String email,
    required String password,
    required String phone,
    required int avatarId,
  }) async {
    final response = await http.post(
      Uri.parse(ApiConstants.registerEndpoint),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "name": name,
        "email": email,
        "password": password,
        "confirmPassword": password,
        "phone": phone,
        "avaterId": avatarId,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final json = jsonDecode(response.body);
      return RegisterModel.fromJson(json);
    } else {
      throw Exception("Failed to register: ${response.body}");
    }
  }
}
