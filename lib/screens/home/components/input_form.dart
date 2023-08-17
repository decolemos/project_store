import 'package:flutter/material.dart';

class InputForm extends StatelessWidget {

  final String labelText;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved; 

  const InputForm({
    super.key, 
    required this.labelText, 
    required this.validator, 
    required this.onSaved, 
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        suffixIcon: const Icon(Icons.person),
        border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))) 
      ),
      // initialValue: formData[fieldKey]
      validator: validator,
      onSaved: onSaved
    );
  }
}


