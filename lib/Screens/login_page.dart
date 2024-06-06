import 'package:api_integration_python/widgets/login_page_widgets/forgot_password.dart';
import 'package:api_integration_python/widgets/login_page_widgets/login_button.dart';
import 'package:api_integration_python/widgets/login_page_widgets/sign_up_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
          ),
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                const SizedBox(height: 40),
                Image.asset("assets/images/logo.png", width: 350, height: 350),
                const SizedBox(
                  child: Text(
                    "Welcome",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Container(
                      alignment: Alignment.bottomCenter,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60),
                        ),
                        color: Colors.blue,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: UserPassField(
                          usernameController: _usernameController,
                          passwordController: _passwordController,
                        ),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UserPassField extends StatefulWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  const UserPassField({
    super.key,
    required this.usernameController,
    required this.passwordController,
  });

  @override
  State<UserPassField> createState() => _UserPassFieldState();
}

class _UserPassFieldState extends State<UserPassField> {
  bool showText = true;

  void togglePasswordVisibility() {
    setState(() {
      showText = !showText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 80),
        TextField(
          controller: widget.usernameController,
          decoration: InputDecoration(
            suffixIcon: const Icon(Icons.person),
            fillColor: Colors.white,
            filled: true,
            labelText: 'Username',
            labelStyle: const TextStyle(
              color: Colors.black,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(16),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 2.0),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        TextField(
          controller: widget.passwordController,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(
                showText ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                togglePasswordVisibility();
              },
            ),
            fillColor: Colors.white,
            filled: true,
            labelText: 'Password',
            labelStyle: const TextStyle(
              color: Colors.black,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(16),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 2.0),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          obscureText: showText,
        ),
        const ForgotPassword(),
        const SizedBox(height: 30),
        LoginButton(
          usernameController: widget.usernameController,
          passwordController: widget.passwordController,
        ),
        const SizedBox(
          height: 7,
        ),
        const SignUpButton(),
      ],
    );
  }
}
