import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paper_trading/core/common_widgets/common_text_fields.dart';
import 'package:paper_trading/core/common_widgets/primary_button.dart';
import 'package:paper_trading/routes/routes_name.dart';
import 'package:paper_trading/utils/common_utils.dart';

class LoginScreen extends HookWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    //it will compute once and reuse it
    final formKey = useMemoized(() => GlobalKey<FormState>());

    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final isShowPassword = useState<bool>(false);
    final isButtonEnable = useState<bool>(false);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: formKey,
          onChanged: () {
            isButtonEnable.value = (formKey.currentState?.validate() == true);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: DecoratedBox(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black26), borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
                    child: Column(
                      children: [
                        Text(
                          "LOGIN",
                          style: GoogleFonts.poppins(fontSize: 26),
                        ),
                        CommonTextFields(
                          label: "Email",
                          obscureText: true,
                          controller: emailController,
                          validator: (value) {
                            final valid = const CommonUtils().validateEmail(value);
                            return valid;
                          },
                        ),
                        const Gap(15),
                        CommonTextFields(
                          label: "Password",
                          controller: passwordController,
                          validator: (value) {
                            final valid = const CommonUtils().validatePassword(value);
                            return valid;
                          },
                          obscureText: isShowPassword.value,
                          suffixIcon: InkWell(
                            onTap: () {
                              isShowPassword.value = !isShowPassword.value;
                            },
                            child: isShowPassword.value
                                ? const Icon(Icons.visibility, size: 20)
                                : const Icon(Icons.visibility_off, size: 20),
                          ),
                        ),
                        const Gap(15),
                        PrimaryButton(
                          buttonText: "Sign-In",
                          enabled: isButtonEnable.value,
                          onPressed: () {
                            if(formKey.currentState?.validate() == true) {
                            }
                          },
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
                        Text(
                          "Forget Password, ",
                          style: GoogleFonts.poppins(),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.pushNamed(RoutesName.forgetPassword);
                          },
                          child: Text(
                            "click here",
                            style: GoogleFonts.poppins(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                    const Gap(10),
                    Row(
                      children: [
                        Text(
                          "New Registration, ",
                          style: GoogleFonts.poppins(),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.pushNamed(RoutesName.signUp);
                          },
                          child: Text(
                            "sign up here",
                            style: GoogleFonts.poppins(color: Colors.blue),
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
      ),
    );
  }
}
