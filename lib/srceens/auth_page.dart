import 'package:flutter/material.dart';

import '../helper/auth.dart';
import 'home_page.dart';

class SingUp extends StatelessWidget {
  const SingUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 260,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.blue.shade500,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Text(
                    "SingUp",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  inputBoxMethod(
                    text: "email",
                    controller: authController.tetEmail,
                  ),
                  inputBoxMethod(
                    controller: authController.tetPassword,
                    text: "password",
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await Auth.auth.singUp(
                        email: authController.tetEmail.text,
                        password: authController.tetPassword.text,
                      );
                      Navigator.of(context).pushReplacementNamed("/home");
                    },
                    child: const Text(
                      "SingUp",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed("/");
                    },
                    child: const Text(
                      "SingIn",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
