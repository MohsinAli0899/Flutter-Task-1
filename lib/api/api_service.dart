import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> login(String username, String password) async {
  final url = Uri.parse('http://127.0.0.1:5000/login');
  final response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'password': password,
    }),
  );

  if (response.statusCode == 200) {
    return {
      "success": true,
      "message": jsonDecode(response.body)['message'],
    };
  } else {
    return {"success": false, "message": jsonDecode(response.body)['message']};
  }
}
