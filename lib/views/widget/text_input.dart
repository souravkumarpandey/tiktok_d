import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController controller;
  final String lableText;
  final bool isObscure;
  final IconData icon;

  
  const TextInputField({super.key, required this.controller, required this. lableText, required this.isObscure, required this.icon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller ,
      decoration: InputDecoration(
        labelText: lableText,
        prefixIcon: Icon(icon),
        labelStyle: const TextStyle(
        fontSize: 20,   
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: borderColor,
          ),
        ),
        focusedBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: borderColor,
          ),
        ),
       
      ),
       obscureText: isObscure,
    );
  }
}