import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  final storage = const FlutterSecureStorage();

  void storageDelete() async {
    await storage.delete(key: "user");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            const Text("Meu perfil", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            Container(
              // color: Colors.black,
              child: Image.asset("assets/avatar.png")
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    storageDelete();
                    Navigator.pop(context);
                    Navigator.pop(context);
                  }, 
                  child: const Text("Sair")
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}