import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {this.hint,
      this.prefix,
      this.suffix,
      this.obscure = false,
      this.textInputType,
      this.onChanged,
      this.enabled,
      this.controller});

  final TextEditingController controller;
  final String hint;
  final Widget prefix;
  final Widget suffix;
  final bool obscure;
  final TextInputType textInputType;
  final Function(String) onChanged;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8, right: 8),
      width: 295,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: '#232129'.toColor(),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.only(left: 8, right: 8, bottom: 8),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        keyboardType: textInputType,
        onChanged: onChanged,
        enabled: enabled,
        //not working
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: '#666360'.toColor()),
          border: InputBorder.none,
          prefixIcon: prefix,
          suffixIcon: suffix,
        ),
        textAlignVertical: TextAlignVertical.center,
      ),
    );
  }
}
