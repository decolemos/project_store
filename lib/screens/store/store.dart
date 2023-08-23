import 'package:flutter/material.dart';

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                
              }, 
              icon: const Icon(
                Icons.account_circle_outlined, 
                color: Colors.black, 
                size: 40
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
              Tab(
                  child: Text("Novidades", style: TextStyle(color: Colors.black),
                )
              ),
              Tab(
                  child: Text("Ofertas", style: TextStyle(color: Colors.black),
                )
              ),
              Tab(
                  child: Text("Assinaturas", style: TextStyle(color: Colors.black),
                )
              ),
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