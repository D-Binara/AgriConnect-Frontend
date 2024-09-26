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
      style: const TextStyle(
          color: Color.fromARGB(199, 46, 46, 46)), // Make text white
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Color.fromARGB(200, 49, 49, 49)),
        hintText: hintText,
        hintStyle: const TextStyle(color: Color.fromARGB(110, 59, 59, 59)),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Color.fromARGB(190, 97, 97, 97),
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
