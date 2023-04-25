import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:login_page/Screens/login.dart';
import 'package:motion_toast/motion_toast.dart';

import '../Components/rounded_container.dart';
import '../Components/rounded_input.dart';
import '../constant.dart';
import 'ForgetPassword.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final email = TextEditingController();
  final password = TextEditingController();
  Future createUserEmailAndPassword() async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: email.text, password: password.text)
        .then((value) {
      print('createed object succesfully');
      MotionToast.success(
        title: Text("Success"),
        description: Text("Acount Created Succesfully"),
      ).show(context);
      Navigator.push(
          context, MaterialPageRoute(builder: ((context) => LoginPage())));
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
              SizedBox(height: 30),
              Text(
                'Welcome',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              SizedBox(height: 40),
              SvgPicture.asset('asset/image/register.svg'),
              SizedBox(height: 30),
              RoundedInput(
                  icon: Icons.person,
                  hint: 'Username',
                  controller: email,
                  obscuretext: false),
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
              RoundedButton(title: 'SignUp', onTap: createUserEmailAndPassword),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: Text(
                  "Already have an account? Login",
                  style: TextStyle(color: kPrimaryColor, fontSize: 18),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
