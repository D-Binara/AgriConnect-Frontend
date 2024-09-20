import 'package:agri_connect/signin.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 150,
            color: const Color.fromARGB(255, 113, 247, 118),
          )
        ],
      ),
    );
  }
}
