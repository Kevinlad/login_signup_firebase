import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:login_page/Components/rounded_container.dart';
import 'package:login_page/Components/rounded_input.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(children: [
        SizedBox(
          height: 60,
        ),
        Text(
          'Recieve an Email to ',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        Text(
          'reset your password',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        SizedBox(
          height: 10,
        ),
        RoundedInput(
            icon: Icons.email,
            hint: 'email',
            controller: email,
            obscuretext: false),
        SizedBox(
          height: 10,
        ),
        RoundedButton(title: 'Reset Password', onTap: resetEmail),
      ])),
    );
  }

  Future resetEmail() async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
  }
}
