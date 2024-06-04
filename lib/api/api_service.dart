import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

Future<Map<String, dynamic>> login(String username, String password) async {
  String getBaseUrl() {
    if (kIsWeb) {
      // URL for web
      return "http://127.0.0.1:5000/proxy/login/$username,$password";
    } else {
      // URL for Android emulator
      return "http://10.0.2.2:5000/proxy/login/$username,$password";
    }
  }

  final baseUrl = Uri.parse(getBaseUrl());
  // final url =
  //     Uri.parse('http://127.0.0.1:5000/proxy/login/$username,$password');

  try {
    final response = await http.get(baseUrl);

    if (response.statusCode == 200) {
      return {
        "success": true,
        "prompt": jsonDecode(response.body)['prompt'],
      };
    } else {
      return {
        "success": false,
        "prompt": jsonDecode(response.body)['Prompt'],
      };
    }
  } catch (e) {
    return {
      "success": false,
      "message": "An unexpected error occurred: $e",
    };
  }
}
