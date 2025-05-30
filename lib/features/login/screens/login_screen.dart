import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paper_trading/core/common_widgets/common_text_fields.dart';
import 'package:paper_trading/routes/routes_name.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: DecoratedBox(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black26),
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 20),
                  child: Column(
                    children: [
                      Text(
                        "LOGIN",
                        style: GoogleFonts.poppins(fontSize: 26),
                      ),
                      const CommonTextFields(
                        label: "Email",
                      ),
                      const Gap(15),
                      const CommonTextFields(
                        label: "Password",
                      ),
                      const Gap(15),
                      SizedBox(
                        width: double.maxFinite,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text("Sign-In"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Gap(15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text("Forget Password, "),
                      GestureDetector(
                        onTap: () {
                          context.pushNamed(RoutesName.forgetPassword);
                        },
                        child: const Text(
                          "click here",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                  const Gap(10),
                  Row(
                    children: [
                      const Text("New Registrtion, "),
                      GestureDetector(
                        onTap: () {
                          context.pushNamed(RoutesName.signUp);
                        },
                        child: const Text(
                          "sign up here",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
