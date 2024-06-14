import 'package:api_integration_python/api/api_service.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool showText = true;

  final _formKey = GlobalKey<FormState>();
  bool isEmailVerified = false;

  void checkEmail() {
    isEmailVerified =
        EmailValidator.validate(_usernameController.text.toString());
  }

  void togglePasswordVisibility() {
    setState(() {
      showText = !showText;
    });
  }

  void registerUser() async {
    if (_formKey.currentState!.validate()) {
      checkEmail(); // Validate email
      if (isEmailVerified) {
        final response =
            await signUp(_usernameController.text, _passwordController.text);

        if (response['success']) {
          // Successfully registered
          ScaffoldMessenger.of(mounted ? context : context).showSnackBar(
            const SnackBar(content: Text('Registration Successful')),
          );
          Navigator.pop(mounted
              ? context
              : context); // If email is verified, pop the page
        } else {
          // Failed registration
          ScaffoldMessenger.of(mounted ? context : context).showSnackBar(
            SnackBar(content: Text(response['message'])),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: const Text("Register new user"),
        backgroundColor: Colors.transparent,
        elevation: 0.8,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Register Here",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    labelText: 'Enter your email address',
                    labelStyle: const TextStyle(
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.red, width: 2.0),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    suffixIcon: const Icon(Icons.person),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    checkEmail();
                  },
                  validator: (value) => isEmailVerified
                      ? null
                      : "Please enter a valid email address",
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    labelText: 'Enter your password',
                    labelStyle: const TextStyle(
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.red, width: 2.0),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        showText ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        togglePasswordVisibility();
                      },
                    ),
                  ),
                  obscureText: showText,
                  validator: (password) {
                    if (password == null || password.isEmpty) {
                      return 'Password cannot be empty';
                    } else if (password.length < 6) {
                      return 'Password must be at least 6 characters long';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: registerUser,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, // Background color
                    foregroundColor: Colors.white, // Text color
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(16), // Rounded corners
                    ),
                  ),
                  key: const ValueKey('signUpButton'),
                  child: const Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
