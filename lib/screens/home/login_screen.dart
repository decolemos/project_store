import 'package:flutter/material.dart';
import 'package:project_store/screens/home/components/login_form.dart';

class LoginScreen extends StatelessWidget {

  

  const LoginScreen({super.key});

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
                  "Login",
                  style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  ),
                ),
              ),
              const LoginForm(
                isLoginScreen: true,
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 250,
                    height: 30,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "register_screen");
                      },
                      child: const Row(
                        children: [
                          Text("Ainda não tem conta?", 
                            style: TextStyle(color: Colors.white,
                             fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(" CLIQUE AQUI!", 
                            style: TextStyle(color: Color(0xff0097D7),
              
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 250,
                    height: 30,
                    child: TextButton(
                      onPressed: () {
                        
                      },
                      child: const Text("Esqueci minha senha!", 
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal)
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}