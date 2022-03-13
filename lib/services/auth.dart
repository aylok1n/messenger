import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:messenger/constants.dart';

class AuthService {
  Future<dynamic> register(String email, String name, String password) async {
    var res = await http.post(
      Uri.parse('$baseUri/auth/register'),
      body: jsonEncode(<String, String>{
        "email": email,
        "name": name,
        "password": password,
      }),
    );
    return res.body;
  }

  Future<dynamic> login(String email, String password) async {
    if (email.isNotEmpty && password.isNotEmpty) {
      var res = await http.post(
        Uri.parse('$baseUri/auth/login'),
        body: jsonEncode(<String, String>{
          "email": email,
          "password": password,
        }),
      );
      return res.body;
    }
  }
}
