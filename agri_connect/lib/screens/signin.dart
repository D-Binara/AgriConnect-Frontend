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

    //----------with backed uncomment this-----------
    // final responseMessage = await _authService.signIn(userName, password);

    setState(() {
      _isLoading = false; 
    });

    //----------with backed uncomment this-----------
    // if (responseMessage == "user logging successfully") {
     //----------without backed comment this-----------
     if (1==1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
         //----------withbacked uncomment this-----------
        // SnackBar(content: Text(responseMessage!)),
         //----------without backed comment this-----------
         SnackBar(content: Text("ok")),

      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 150),
                  const Text(
                    'Sign In Now',
                    style: TextStyle(fontSize: 25, color: Colors.white),
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
                          color: Color.fromARGB(255, 111, 173, 254),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  RoundedButton(
                    text: 'Sign In',
                    onPressed: _signIn,
                    isLoading: _isLoading,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don’t have an account?',
                        style: TextStyle(color: Colors.white),
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
                            color: Color.fromARGB(255, 111, 173, 254),
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
