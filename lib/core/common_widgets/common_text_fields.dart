import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonTextFields extends StatelessWidget {
  final String label;
  final TextEditingController? controller;

  const CommonTextFields({
    super.key,
    required this.label,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(fontSize: 14),
        ),
        TextField(
          controller: controller,
          decoration: const InputDecoration(border: OutlineInputBorder()),
        ),
      ],
    );
  }
}
