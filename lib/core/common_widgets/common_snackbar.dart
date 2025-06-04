import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paper_trading/utils/string_constants.dart';

class CommonSnackBar {
  // private constructor to prevent instantiation
  const CommonSnackBar._();

  static void showSnackBar({
    required BuildContext context,
    required Color msgColor,
    Color backgroundColor = Colors.white,
    String msg = StringConstants.someThingWentWrong,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: backgroundColor,
        content: Text(msg, style: GoogleFonts.poppins(color: msgColor)),
      ),
    );
  }
}
