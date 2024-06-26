// ignore_for_file: use_build_context_synchronously, no_leading_underscores_for_local_identifiers

import 'package:api_integration_python/Screens/login_page.dart';
import 'package:api_integration_python/api/api_service.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final String email;
  const MyDrawer({super.key, required this.email});
  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text("Confirm Delete 🚫"),
          content: const Text(
            "Are you sure you want to delete your account?",
            style: TextStyle(
              fontWeight: FontWeight.w400,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Close the dialog
              },
              child: const Text("No"),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(dialogContext).pop(); // Close the dialog

                // Show progress indicator using a new context
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                );

                // Wait for 2 seconds and delete the account
                await Future.delayed(const Duration(seconds: 2));
                final result = await deleteAccount(email);

                // Close the progress indicator
                Navigator.of(context, rootNavigator: true).pop();

                // Show snack bar using a new context
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(result['Prompt'])),
                );

                if (result['success']) {
                  Navigator.of(context, rootNavigator: true).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                }
              },
              child: const Text("Yes"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var username = email.substring(0, email.indexOf('@'));
    const imageUrl =
        "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png";
    return Drawer(
      child: Container(
        color: Colors.blue,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text(username),
                accountEmail: Text(email), // Use email here directly
                currentAccountPicture: const CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                ),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
              ),
            ),
            const ListTile(
              title: Text(
                "Logout",
                textScaler: TextScaler.linear(1.2),
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              title: GestureDetector(
                onTap: () => _showDeleteConfirmationDialog(context),
                child: const Text(
                  "Delete Account",
                  textScaler: TextScaler.linear(1.2),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
