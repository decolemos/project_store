import 'package:flutter/material.dart';

class InputForm extends StatelessWidget {

  final String labelInput;
  final String returnValidator;
  final Map<String, String> formData;
  final String fieldKey;

  const InputForm({
    super.key, 
    required this.labelInput, 
    required this.returnValidator, 
    required this.formData, 
    required this.fieldKey
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelInput,
        suffixIcon: const Icon(Icons.person),
        border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))) 
      ),
      initialValue: formData[fieldKey],
      validator: (value) {
        if(value == null || value.isEmpty) {
          return returnValidator;
        } 
        return null;
      },
      onSaved: (newValue) {
        formData[fieldKey] = newValue!;
      },
    );
  }
}


        // const SizedBox(
        //   height: 20,
        // ),
        // TextFormField(
        //   decoration: const InputDecoration(
        //     labelText: "Senha:",
        //     suffixIcon: Icon(Icons.key),
        //     border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))
        //   ),
        //   validator: (value) {
        //     if(value == null || value.isEmpty) {
        //       return "Senha não pode ser vazia";
        //     } else if(value.length < 8) {
        //       return "Minimo de 8 caracteres";
        //     }
        //     return null;
        //   },
        //   onSaved: (newValue) {
        //     formData["password"] = newValue!;
        //   },
        // ),