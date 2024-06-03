import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {},
          child: const Text(
            'Forgot Password?',
            style: TextStyle(
              color: Colors.black,
              decoration: TextDecoration
                  .underline, // Optional: to make it look like a link
            ),
          ),
        ),
      ],
    );
  }
}
