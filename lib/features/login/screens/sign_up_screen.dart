import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paper_trading/core/common_widgets/common_text_fields.dart';
import 'package:paper_trading/core/common_widgets/primary_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "SIGN-UP",
              style: GoogleFonts.poppins(fontSize: 26),
            ),
            const Gap(15),
            const CommonTextFields(
              label: "Name",
            ),
            const Gap(15),
            const CommonTextFields(
              label: "Email",
            ),
            const Gap(15),
            const CommonTextFields(
              label: "Password",
            ),
            const Gap(50),
            PrimaryButton(
              buttonText: "Sign-up",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
