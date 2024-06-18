// import 'dart:convert';
// import 'package:http/http.dart' as http;

// Future<Map<String, dynamic>> login(String username, String password) async {
//   // String getBaseUrl() {
//   //   if (kIsWeb) {
//   //     // URL for web
//   //     return "https://development-gold.vercel.app/login/$username,$password";
//   //   } else {
//   //     // URL for Android emulator
//   //     return "https://development-gold.vercel.app/login/$username,$password";
//   //   }
//   // }

//   // final baseUrl = Uri.parse(getBaseUrl());
//   final baseUrl = Uri.parse(
//       'https://development-gold.vercel.app/login/$username,$password');

//   final response = await http.get(baseUrl);

//   if (response.statusCode == 200) {
//     return {
//       "success": true,
//       "Prompt": jsonDecode(response.body)['Prompt'],
//     };
//   } else {
//     return {
//       "success": false,
//       "Prompt": jsonDecode(response.body)['Prompt'],
//     };
//   }
// }

// // SIGNUP API

// Future<Map<String, dynamic>> signUp(String email, String password) async {
//   final url = Uri.parse('http://127.0.0.1:5000');
//   final response = await http.post(
//     url,
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, String>{
//       'email': email,
//       'password': password,
//     }),
//   );

//   if (response.statusCode == 201) {
//     return {
//       "success": true,
//       "message": jsonDecode(response.body)['message'],
//     };
//   } else {
//     return {
//       "success": false,
//       "message": jsonDecode(response.body)['message'],
//     };
//   }
// }

// LOGIN API ----------------------------------*************************

import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> login(String username, String password) async {
  final url = Uri.parse('http://127.0.0.1:5000/user/login');
  final headers = {'Content-Type': 'application/x-www-form-urlencoded'};
  final body = {'username': username, 'password': password};

  final response = await http.post(
    url,
    headers: headers,
    body: body,
  );
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

// SIGN UP API ----------------------------------****************************

Future<Map<String, dynamic>> signUp(String username, String password) async {
  final url = Uri.parse('http://127.0.0.1:5000/user/addone');
  final headers = {'Content-Type': 'application/x-www-form-urlencoded'};

  final body = {'username': username, 'password': password};

  final response = await http.post(
    url,
    headers: headers,
    body: body,
  );
  print(response.statusCode);

  if (response.statusCode == 200) {
    return {
      "success": true,
      "message": jsonDecode(response.body)['message'],
    };
  } else {
    return {
      "success": false,
      "message": jsonDecode(response.body)['message'],
    };
  }
}
