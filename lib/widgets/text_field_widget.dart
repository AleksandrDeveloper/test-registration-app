import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final Function(String)? onChanget;
  final TextEditingController controller;
  final TextInputType textInputType;
  final Icon icon;

  final bool obscureText;
  const TextFieldWidget({
    required this.onChanget,
    required this.textInputType,
    required this.obscureText,
    required this.icon,
    required this.controller,
    required this.hintText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: TextField(
        onChanged: onChanget,
        controller: controller,
        keyboardType: textInputType,
        obscureText: obscureText,
        style: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(color: const Color(0xffffffff)),
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: icon,
          hintStyle: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: const Color(0xffffffff)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 3,
              color: Theme.of(context).primaryColor,
            ),
            borderRadius: BorderRadius.circular(30.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 2,
              color: Color(0xffffffff),
            ),
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
    );
  }
}
