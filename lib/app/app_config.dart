import 'package:flutter/material.dart';
import 'package:project_store/providers/provider_controller.dart';
import 'package:project_store/screens/register/register_screen.dart';
import 'package:project_store/screens/store/store.dart';
import 'package:provider/provider.dart';

import '../screens/home/login_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProviderController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/":(context) => const Store(),
          "register_screen":(context) => const RegisterScreen()
        },
      ),
    );
  }
}
