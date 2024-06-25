import 'package:flutter/material.dart';
import 'package:api_integration_python/utils/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Home Page"),
        backgroundColor: Colors.blue,
        elevation: 0.5,

        // COMMENTED OUT BECAUSE WE DON"T NEED BACK BUTTON IN HOME PAGE

        // // leading: IconButton(
        // //   icon: const Icon(Icons.arrow_back),
        // //   color: Colors.black,
        // //   onPressed: () {
        // //     SystemNavigator.pop(); // Close the app
        // //   },
        // ),
        // actions: [
        //   Builder(
        //     builder: (context) => IconButton(
        //       icon: const Icon(Icons.menu),
        //       color: Colors.black,
        //       onPressed: () {
        //         Scaffold.of(context).openDrawer();
        //       },
        //     ),
        //   ),
        // ],
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Login Successful",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Welcome to Mintways App",
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
