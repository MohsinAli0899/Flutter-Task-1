import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> login(String username, String password) async {
 /* String getBaseUrl() {
    if (kIsWeb) {
      // URL for web
      return "http://127.0.0.1:5001/proxy/login/$username,$password";
    } else {
      // URL for Android emulator
      return "http://10.0.2.2:5001/proxy/login/$username,$password";
    }
  }

  final baseUrl = Uri.parse(getBaseUrl());  */
  final baseUrl =
  Uri.parse('https://development-gold.vercel.app/login/$username,$password');

  final response = await http.get(baseUrl);

  if (response.statusCode == 200) {
    return {
      "success": true,
      "Prompt": jsonDecode(response.body)['Prompt'],
    };
  } else {
    return {
      "success": false,
      "Prompt": jsonDecode(response.body)['Prompt'],
    };
  }
}
