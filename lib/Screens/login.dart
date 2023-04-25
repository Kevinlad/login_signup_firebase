import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:login_page/Screens/register.dart';

import '../Components/rounded_container.dart';
import '../Components/rounded_input.dart';
import '../constant.dart';
import '../main.dart';
import 'ForgetPassword.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final password = TextEditingController();

  Future signWithEmailAndPassword() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email.text, password: password.text)
        .then((value) {
      print('login succesfully');
      Navigator.push(context, MaterialPageRoute(builder: (context) => Hello()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Welcome Back',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Image.asset('asset/image/login.webp'),
                SizedBox(height: 20),
                RoundedInput(
                  icon: Icons.mail,
                  hint: 'Username',
                  controller: email,
                  obscuretext: false,
                ),
                SizedBox(
                  height: 10,
                ),
                RoundedInput(
                  icon: Icons.password,
                  hint: 'Password',
                  controller: password,
                  obscuretext: true,
                ),
                SizedBox(
                  height: 10,
                ),
                RoundedButton(
                  title: 'LOGIN',
                  onTap: signWithEmailAndPassword,
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(height: 10),
                GestureDetector(
                  child: Text(
                    "Forget Password",
                    style: TextStyle(color: kPrimaryColor, fontSize: 18),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgetPassword()));
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUp()));
                  },
                  child: Text(
                    "Don't have an account? Sign up",
                    style: TextStyle(color: kPrimaryColor, fontSize: 18),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
