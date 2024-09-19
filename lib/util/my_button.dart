import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color buttonColor; // New parameter for button color

  MyButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.buttonColor = Colors.blue, // Default color
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: buttonColor, // Use the passed button color
      child: Text(text),
    );
  }
}
