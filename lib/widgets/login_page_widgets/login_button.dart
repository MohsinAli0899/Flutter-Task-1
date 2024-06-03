import 'package:api_integration_python/utils/routes.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatefulWidget {
  const LoginButton({super.key});

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Navigate to the home page when the button is clicked
        Navigator.pushNamed(
          context,
          MyRoutes.homeRoute,
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red, // Background color
        foregroundColor: Colors.white, // Text color
        padding: const EdgeInsets.symmetric(
          horizontal: 35,
          vertical: 15,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16), // Rounded corners
        ),
      ),
      child: const Text(
        'Login',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
