import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paper_trading/core/common_widgets/common_text_fields.dart';
import 'package:paper_trading/core/common_widgets/primary_button.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "FORGET PASSWORD",
              style: GoogleFonts.poppins(fontSize: 26),
            ),
            const Gap(15),
            const CommonTextFields(
              label: "Email",
            ),
            const Gap(15),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "We will sent you Password at a Registered mail!",
                style: GoogleFonts.poppins(),
              ),
            ),
            const Gap(50),
            PrimaryButton(
              buttonText: "Continue",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
