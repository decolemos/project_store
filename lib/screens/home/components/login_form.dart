import 'package:flutter/material.dart';
import 'package:project_store/screens/home/components/input_form.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  
  final _formKey = GlobalKey<FormState>();

  final Map<String, String> formData = {};

  void _submit() {
    _formKey.currentState!.validate();
    _formKey.currentState!.save();
    print(formData["user"]);
    print(formData["password"]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5, left: 15, right: 15),
      width: double.infinity,
      height: 295,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white
      ),
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              InputForm(
                labelInput: "Usuário:",
                returnValidator: "Usuário não pode ser vazio",
                formData: formData,
                fieldKey: "user",
              ),
              const SizedBox(
                height: 20,
              ),
              InputForm(
                labelInput: "Senha:",
                returnValidator: "Senha não pode ser vazia",
                formData: formData,
                fieldKey: "password",
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    return _submit();
                  },
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Color(0xff0097D7))
                  ),
                  child: const Text(
                    "ENTRAR",
                    style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}