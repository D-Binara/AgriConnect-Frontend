import 'package:agri_connect/second.dart';
import 'package:flutter/material.dart';
import 'package:agri_connect/main.dart';

class First extends StatelessWidget {
  const First({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Add background image
          Positioned.fill(
            child: Image.asset(
              'assets/first.png',
              fit: BoxFit.cover, // Make the image cover the entire screen
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainApp(),
                  ),
                );
              },
              child: Image.asset('assets/arrow.png'),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 150),
                  const Text(
                    'Welcome to AgriConnect!',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    'AgriConnect is an innovative platform designed to address the pressing issues of food wastage and high food prices in Sri Lanka. Each year, approximately 500,000 MT of fruits and vegetables go to waste due to excessive production and market inefficiencies. In addition, food inflation reached 95% in 2022, making it challenging for consumers to afford fresh produce.',
                    style: TextStyle(
                      color: Color.fromARGB(255, 200, 200, 200),
                    ),
                    textAlign:
                        TextAlign.justify, // Proper alignment for paragraphs
                  ),
                  const SizedBox(height: 50),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Second(),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 80),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 33, 54, 243),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: const Text(
                        'Explore',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
