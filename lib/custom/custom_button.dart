import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Size size;
  final String labelText;

  const CustomButton({super.key, required this.size, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: size.width,
        margin: EdgeInsets.symmetric(
          vertical: size.width * .035,
        ),
        padding: EdgeInsets.symmetric(vertical: size.width * .02),
        decoration: BoxDecoration(
          color: const Color(0xFFD9D9D9),
          borderRadius: BorderRadius.circular(size.width * .015),
        ),
        child: Center(
          child: Text(
            labelText,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: size.width * .04,
              color: const Color(0xFF16404D),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
