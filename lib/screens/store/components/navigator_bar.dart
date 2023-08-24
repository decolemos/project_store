import 'package:flutter/material.dart';
import 'package:project_store/screens/store/components/tab_component.dart';

class NavigatorBar extends StatelessWidget {
  const NavigatorBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            }, 
            icon: const Icon(Icons.arrow_back, color: Colors.black)
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/user_profile");
              }, 
              icon: const Icon(
                Icons.account_circle_outlined, 
                color: Colors.black, 
                size: 30
              )
            )
          ],
          backgroundColor: Colors.white,
          title: Row(
            children: [
              SizedBox(
                width: 200,
                child: Image.asset("assets/logo.png")
              ),
            ],
          ),
          bottom: const TabBar(
            tabs: <Widget> [
             TabComponent(tilte: "Novidades"),
             TabComponent(tilte: "Ofertas"),
             TabComponent(tilte: "Assinaturas"),
            ]
          ),
        ),
        body: const TabBarView(
          children: [
            Center(
              child: Text("Novidades"),
            ),
            Center(
              child: Text("Ofertas"),
            ),
            Center(
              child: Text("Assinaturas"),
            ),
          ]
        ),
      ),
    );
  }
}