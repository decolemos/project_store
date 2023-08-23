import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProviderController extends ChangeNotifier {
  final String urlSingUp = "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyDiiMyJcvmJGynqJTsp201kZyfBgDd3YZE";
  final String urlSingIn = "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyDiiMyJcvmJGynqJTsp201kZyfBgDd3YZE";

  Future<void> createUserInFirebase(String user, String password) async {
    try {
      final response = await http.post(Uri.parse(urlSingUp),
        body: jsonEncode({
          "email": user,
          "password": password,
          "returnSecureToken": true
        })
      );

      final jsonResponse = jsonDecode(response.body);

      final statusCodeResponse = jsonDecode(response.statusCode.toString());

      if (jsonResponse == null || statusCodeResponse != 200) {
        log("Usuário não foi criado!");
      } else {
        log("Usuário criado com sucesso!");
      }

    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> loginInWithUserCreated(String user, String password) async {
    try {
      final response = await http.post(Uri.parse(urlSingIn),
        body: jsonEncode({
          "email": user,
          "password": password,
          "returnSecureToken": true
        })
      );

      final jsonResponse = jsonDecode(response.body);

      final statusCodeResponse = jsonDecode(response.statusCode.toString());

      if (jsonResponse == null || statusCodeResponse != 200) {
        log("Usuário ou senha incorreto");
      } else {
        log("Logando");
      }

      final token = jsonResponse["idToken"];

      log(token);
      log(statusCodeResponse.toString());
    } catch (e) {
      log(e.toString());
    }
  }
}
