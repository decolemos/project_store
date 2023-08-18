import 'package:flutter/material.dart';
import 'package:project_store/screens/home/components/input_form.dart';

class LoginForm extends StatefulWidget {

  final bool isLoginScreen;

  const LoginForm({
    super.key, 
    required this.isLoginScreen
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  
  final _formKey = GlobalKey<FormState>();

  final Map<String, String> formData = {};

  void _submit() {
    _formKey.currentState!.validate();
    _formKey.currentState!.save();
    print(formData["name"]);
    print(formData["user"]);
    print(formData["password"]);
    print(formData["checkPassword"]);
  }

  @override
  Widget build(BuildContext context) {
              
    return Container(
        margin: const EdgeInsets.only(top: 5, left: 15, right: 15),
        width: double.infinity,
        height: widget.isLoginScreen == true
        ? 280
        : 550,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.white
        ),
        child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.isLoginScreen == true
              ? Column(
                children: [
                  InputForm(
                    labelText: "Usuário:",
                    validator: (value) {
                      if(value == null || value.isEmpty) {
                        return "Usuário não pode ser vazio";
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      formData["user"] = newValue!;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InputForm(
                    labelText: "Senha:",
                    validator: (value) {
                      if(value == null || value.isEmpty) {
                        return "Senha não pode ser vazia";
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      formData["password"] = newValue!;
                    },
                  ),
                ],
              )
              : Column(
                children: [
                  InputForm(
                    labelText: "Nome:", 
                    validator: (value) {
                      if(value == null || value.isEmpty) {
                        return "Informe seu nome";
                      }
                      return null;
                    }, 
                    onSaved: (newValue) {
                      formData["name"] = newValue!;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InputForm(
                    labelText: "Usuário:", 
                    validator: (value) {
                      if(value == null || value.isEmpty) {
                        return "Crie um usuário!";
                      }
                      return null;
                    }, 
                    onSaved: (newValue) {
                      formData["user"] = newValue!;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InputForm(
                    labelText: "Senha:",
                    validator: (value) {
                      if(value == null || value.isEmpty) {
                        return "Necessário criar uma senha";
                      } else if(value.length < 8) {
                        return "Minimo de 8 caracteres";
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      formData["password"] = newValue!;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InputForm(
                    labelText: "Confirmar senha:",
                    validator: (value) {
                      if(value == null || value.isEmpty) {
                        return "Confirme a senha que foi criada";
                      } else if(value.length < 8) {
                        return "Minimo de 8 caracteres";
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      formData["checkPassword"] = newValue!;
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
                Column(
                  children: [
                  widget.isLoginScreen == true
                    ? ElevatedButton(
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
                    )
                    : Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {
                              return _submit();
                            },
                            style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(Color(0xff0097D7)),
                            ),
                            child: const Text(
                              "CADASTRAR",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, "/");
                            }, 
                            style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(Color(0xff0097D7)),
                            ),
                            child: const Text(
                              "VOLTAR",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              )
                            )
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        )
      );
    }
  }
