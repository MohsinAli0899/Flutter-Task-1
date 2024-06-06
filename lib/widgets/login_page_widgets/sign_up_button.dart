import 'package:api_integration_python/Screens/sign_up_page.dart';
import 'package:flutter/material.dart';

class SignUpButton extends StatefulWidget {
  const SignUpButton({super.key});

  @override
  State<SignUpButton> createState() => _SignUpButtonState();
}

class _SignUpButtonState extends State<SignUpButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SignUpPage(),
              ),
            );
          },
          child: const Text(
            "Don't have an account? Sign up",
            style: TextStyle(
              color: Colors.black,
              decoration:
                  TextDecoration.underline, //To Make it look like an ink
            ),
          ),
        ),
      ],
    );
  }
}
