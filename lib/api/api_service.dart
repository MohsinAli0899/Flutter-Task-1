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

//LOGIN SENDING GET REQUEST ---------------------

import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> login(String email, String password) async {
  final url = Uri.parse('https://flask-login-three.vercel.app/user/login');
  final headers = {'Content-Type': 'application/json'};

  final body = jsonEncode({'email': email, 'password': password});

  final response = await http.post(
    url,
    headers: headers,
    body: body,
  );

  // Attempt to send the body with a GET request
  // final client = http.Client();
  // final request = http.Request('GET', url)
  //   ..headers.addAll(headers)
  //   ..body = body;

  // final response = await client.send(request);
  // final responseBody = await response.stream.bytesToString();

  try {
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
  } catch (e) {
    return {
      "success": false,
      "Prompt": "Server is down please try again later",
    };
  }
}

// SIGN UP API ----------------------------------****************************

Future<Map<String, dynamic>> signUp(String email, String password) async {
  final url = Uri.parse('https://flask-login-three.vercel.app/user/addone');
  final headers = {'Content-Type': 'application/json'};
  final body = jsonEncode({'email': email, 'password': password});

  final response = await http.post(
    url,
    headers: headers,
    body: body,
  );

  try {
    if (response.statusCode == 201) {
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
  } catch (e) {
    return {
      "success": false,
      "Prompt": "Server is down please try again later",
    };
  }
}

// DELETE ACCOUNT API CALL

Future<Map<String, dynamic>> deleteAccount(String email) async {
  final url = Uri.parse('https://flask-login-three.vercel.app/user/delete');
  final headers = {'Content-Type': 'application/json'};
  final body = jsonEncode({'email': email});

  final response = await http.delete(
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

// FORGET PASSWORD API CALL

Future<Map<String, dynamic>> forgetPassword(String email) async {
  final url = Uri.parse('https://flask-login-three.vercel.app/user/forgotpass');
  final headers = {'Content-Type': 'application/json'};
  final body = jsonEncode({'email': email});

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
