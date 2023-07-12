import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final String label;
  final VoidCallback onPressed;
  const CustomButton({super.key, required this.width, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 18),
        ),
        child: Text(label),
      ),
    );
  }
}