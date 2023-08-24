// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:project_store/screens/home/components/input_form.dart';
import 'package:provider/provider.dart';

import '../../../providers/provider_controller.dart';

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

  final storage = const FlutterSecureStorage();
  
  final _formKey = GlobalKey<FormState>();

  final Map<String, String> formData = {};

  void _login() async {
    
    if(_formKey.currentState!.validate() == false) return; 

    _formKey.currentState!.save();

    try{
      await Provider.of<ProviderController>(context, listen: false).loginInWithUserCreated(
        formData["user"]!, formData["password"]!
      );
      await storage.write(key: "user", value: formData["user"]);
      Navigator.pushNamed(context, "/store");
    }catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString()
          )
        )
      );
    }

    print(formData["name"]);
    print(formData["user"]);
    print(formData["password"]);
    print(formData["checkPassword"]);

  }

  void _createUser() async {

    if(_formKey.currentState!.validate() == false) return; 

    _formKey.currentState!.save();

    try{
      await Provider.of<ProviderController>(context, listen: false).createUserInFirebase(
        formData["user"]!, formData["password"]!
      );
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Usuário criado com sucesso!")));
      Navigator.pop(context);
    }catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString()
          )
        )
      );
    }
  }



  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderController>(context);
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
                      // if(value == null || value.isEmpty) {
                      //   return "Informe seu nome";
                      // }
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
                      // if(value == null || value.isEmpty) {
                      //   return "Confirme a senha que foi criada";
                      // } else if(value.length < 8) {
                      //   return "Minimo de 8 caracteres";
                      // }
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
                        _login();
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
                              _createUser();
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
