import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final Size size;
  final String labelText;

  const CustomTextfield(
      {super.key, required this.size, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      margin: EdgeInsets.symmetric(
        vertical: size.width * .025,
      ),
      child: TextField(
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            fontFamily: 'Poppins',
            fontSize: size.width * .035,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF16404D)
          ),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(size.width * .015),
            borderSide: const BorderSide(
              color: Color(0xFFD9D9D9),
              width: 0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(size.width * .015),
            borderSide: const BorderSide(
              color: Color(0xFFD9D9D9),
              width: 0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(size.width * .015),
            borderSide: const BorderSide(
              color: Color(0xFFD9D9D9),
              width: 0,
            ),
          ),
          fillColor: const Color(0xFFD9D9D9),
        ),
      ),
    );
  }
}
