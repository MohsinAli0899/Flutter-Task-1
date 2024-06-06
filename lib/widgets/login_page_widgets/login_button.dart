// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:api_integration_python/api/api_service.dart';
import 'package:api_integration_python/utils/routes.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatefulWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  const LoginButton(
      {super.key,
      required this.usernameController,
      required this.passwordController});

  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  bool _isLoading = false;
  bool isEmptyTextField = true;

  void _login(BuildContext context) async {
    final username = widget.usernameController.text;
    final password = widget.passwordController.text;
    if (username.isNotEmpty && password.isNotEmpty) {
      setState(() {
        _isLoading = true;
      });

      final result = await login(username, password);

      setState(() {
        _isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(result['Prompt'])),
      );

      if (result['Prompt'] == 'Access Granted') {
        Navigator.pushNamed(context, MyRoutes.homeRoute);
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("Username or Password field Can't be empty")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      child: _isLoading
          ? const CircularProgressIndicator()
          : ElevatedButton(
              onPressed: () => _login(context),
              // Navigate to the home page when the button is clicked

              // Navigator.pushNamed(
              //   context,
              //   MyRoutes.homeRoute,
              // );

              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Background color
                foregroundColor: Colors.white, // Text color
                padding: const EdgeInsets.symmetric(
                  horizontal: 80,
                  vertical: 10,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16), // Rounded corners
                ),
              ),
              key: const ValueKey('loginButton'),
              child: const Text(
                'Login',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
    );
  }
}
