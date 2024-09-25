import 'package:agri_connect/screens/firstpage.dart';
import 'package:agri_connect/screens/signin.dart';
import 'package:agri_connect/screens/signup.dart';
import 'package:flutter/material.dart';

class Second extends StatelessWidget {
  const Second({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Add background image
          Positioned.fill(
            child: Image.asset(
              'assets/second.png',
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
                    builder: (context) => const First(),
                  ),
                );
              },
              child: Image.asset('assets/arrow.png'),
            ),
          ),
          Positioned(
            bottom: 0, // Position all content at the bottom
            left: 0,
            right: 0,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Join with us to continue your agricultural journey',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center, // Centered for a title effect
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'AgriConnect empowers farmers with tools like soil analysis, crop recommendations, and AI-based disease identification, helping them optimize production and sell directly to consumers. For the public, it offers affordable fresh produce and plant disease solutions. The platform aims to reduce food waste, boost farmer incomes, and provide access to fresh, affordable food.',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    textAlign:
                        TextAlign.justify, // Proper alignment for paragraphs
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .center, // Centers the buttons in the row
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignIn(),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 40), // Adjust padding
                          decoration: BoxDecoration(
                            color: Color.fromARGB(
                                255, 2, 173, 112), // Updated color #5a6d2b
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
                            'Sign In',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                          width: 20), // Adds space between the buttons
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUp(),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 40), // Adjust padding
                          decoration: BoxDecoration(
                            color:
                                Colors.white, // Sign Up button background color
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
                            'Sign Up',
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
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
