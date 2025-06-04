import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonTextFields extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final AutovalidateMode autoValidateMode;
  final Function(String?)? validator;
  final Function()? onTap;
  final bool obscureText;

  const CommonTextFields({
    super.key,
    required this.label,
    this.controller,
    this.suffixIcon,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    this.validator,
    this.onTap,
    this.obscureText = false,
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
        TextFormField(
          autovalidateMode: autoValidateMode,
          controller: controller,
          validator: (value) => validator?.call(value),
          onTap: onTap,
          obscureText: !obscureText,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}
