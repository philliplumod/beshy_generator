import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final bool? enabledtext;

  const CustomTextField({
    Key? key,
    required this.label,
    this.controller,
    this.onChanged,
    this.enabledtext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.only(top: 16),
      width: width * 0.5,
      height: height * 0.2,
      child: TextField(
        enabled: enabledtext ?? true,
        controller: controller,
        onChanged: onChanged,
        maxLines: null,
        expands: true,
        textAlignVertical: TextAlignVertical.top,
        style: const TextStyle(fontSize: 16),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(16),
          border: const OutlineInputBorder(),
          labelText: label,
          labelStyle: const TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
