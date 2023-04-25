import 'dart:async';

import 'package:flutter/material.dart';

import '../constant.dart';
import 'input_container.dart';

class RoundedInput extends StatelessWidget {
  const RoundedInput({
    Key? key,
    required this.icon,
    required this.hint,
    required this.controller,
    required this.obscuretext,
  }) : super(key: key);
  final bool obscuretext;
  final IconData icon;
  final String hint;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return InputContainer(
        child: TextField(
      obscureText: obscuretext,
      controller: controller,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
          icon: Icon(icon, color: kPrimaryColor),
          hintText: hint,
          border: InputBorder.none),
    ));
  }
}
