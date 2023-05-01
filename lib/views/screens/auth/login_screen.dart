import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/views/widget/text_input.dart';

class LoginScreen extends StatelessWidget {


   LoginScreen({super.key});
  
    final TextEditingController _emailController= TextEditingController();
    final TextEditingController _passwordController= TextEditingController();

  
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(
            'Tiktok Clone',
            style: TextStyle(
              fontSize: 35,
              color: buttonColor,
              fontWeight: FontWeight.w900,
            ),
          ),
          const Text(
            'Login',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 25,),
          Container(
            child: TextInputField(
              controller: _emailController,
              isObscure: false,
              lableText: 'Email' ,
              icon: Icons.email,
              ),
          ),
        ],
      ),
    ));
  }
}
