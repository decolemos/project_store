import 'package:flutter/material.dart';

import '../home/components/login_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff393333),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                child: Image.network(
                  "https://i.ibb.co/FD4DV6k/psn-logo.png"
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                margin: const EdgeInsets.only(left: 20),
                width: double.infinity,
                child: const Text(
                  "Cadastro",
                  style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  ),
                ),
              ),
              const LoginForm(
                isLoginScreen: false,
              ),
            ]
          )
        )
      )
    );
  }
}