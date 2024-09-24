import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final bool isPassword;

  const InputField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.icon,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      style: const TextStyle(color: Colors.black26), // Make text white
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.black26),
        hintText: hintText,
        hintStyle: const TextStyle(color: Color.fromARGB(111, 29, 28, 28)),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Color.fromARGB(188, 27, 26, 26),
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
