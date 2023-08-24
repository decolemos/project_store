// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TabComponent extends StatelessWidget {

  final String tilte;

  const TabComponent({
    Key? key,
    required this.tilte,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
        child: Text(tilte, style: const TextStyle(color: Colors.black),
      )
    );
  }
}
