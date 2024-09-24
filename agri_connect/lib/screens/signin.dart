import 'package:flutter/material.dart';
import 'package:agri_connect/services/auth_service.dart';
import 'package:agri_connect/screens/homepage.dart';
import 'package:agri_connect/screens/signup.dart';
import 'package:agri_connect/screens/forgotpassword.dart';
import 'package:agri_connect/screens/second.dart';
import 'package:agri_connect/widgets/input_field.dart';
import 'package:agri_connect/widgets/rounded_button.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  bool _isLoading = false;

  Future<void> _signIn() async {
    setState(() {
      _isLoading = true;
    });

    final String userName = _usernameController.text;
    final String password = _passwordController.text;

    // Uncomment this when connecting to a backend
    // final responseMessage = await _authService.signIn(userName, password);

    setState(() {
      _isLoading = false;
    });

    // Uncomment this when connected to a backend
    // if (responseMessage == "user logging successfully") {

    // For testing without backend
    if (1 == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          // Uncomment this when connected to a backend
          // content: Text(responseMessage!),
          content: Text("Failed to sign in"), // Change message for testing
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/signin.png',
              fit: BoxFit.cover,
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
                    builder: (context) => const Second(),
                  ),
                );
              },
              child: Image.asset('assets/arrow.png'),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    'Sign In Now',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Dark text for light theme
                    ),
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(height: 20),
                  const TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person, color: Colors.black87),
                      hintText: 'Username',
                      hintStyle: TextStyle(
                        color: Color.fromARGB(180, 100, 100, 100),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock, color: Colors.black87),
                      hintText: 'Password',
                      hintStyle:
                          TextStyle(color: Color.fromARGB(180, 100, 100, 100)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 2, 173, 112),
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Please sign in to continue using our app',
                    style: TextStyle(color: Color.fromARGB(255, 200, 200, 200)),
                  ),
                  const SizedBox(height: 20),
                  InputField(
                    controller: _usernameController,
                    hintText: 'Username',
                    icon: Icons.person,
                  ),
                  const SizedBox(height: 20),
                  InputField(
                    controller: _passwordController,
                    hintText: 'Password',
                    icon: Icons.lock,
                    isPassword: true,
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Forgot(),
                          ),
                        );
                      },
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Color.fromARGB(255, 2, 173, 112),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      _signIn();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 80),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 2, 173, 112),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
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
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don’t have an account?',
                        style: TextStyle(color: Colors.black),
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUp(),
                            ),
                          );
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Color.fromARGB(255, 2, 173, 112),
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
