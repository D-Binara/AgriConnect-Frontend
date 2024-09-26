// services/auth_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String _baseUrl = 'http://13.53.54.49:8000';

  Future<String?> signIn(String userName, String password) async {
    final String url = '$_baseUrl/login';

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'user_name': userName,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        return jsonResponse['detail']; // "user logging successfully"
      } else if (response.statusCode == 400) {
        return 'Bad request, please try again';
      } else if (response.statusCode == 401) {
        return 'Incorrect username or password';
      } else {
        return 'Unknown error occurred';
      }
    } catch (error) {
      return 'Failed to connect: $error';
    }
  }

  Future<String?> signUp(
      String userName, String email,String password) async {
    final String url =
        '$_baseUrl/register'; // Adjust the endpoint based on your API

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'user_name': userName,
          'email': email,
          'password': password
        }),
      );

print(jsonEncode(<String, String>{
  'user_name': userName,
  'email': email,
  'password': password
}));

      if (response.statusCode == 200) {
        return "User registered successfully";
      } else if (response.statusCode == 400) {
        return 'Bad request, please check your input';
      } else if (response.statusCode == 409) {
        return 'User already exists';
      } else {
        return 'Unknown error occurred during registration';
      }
    } catch (error) {
      return 'Failed to connect: $error';
    }
  }
}
