import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paper_trading/core/common_widgets/common_text_fields.dart';
import 'package:paper_trading/core/common_widgets/primary_button.dart';
import 'package:paper_trading/utils/common_utils.dart';

class ForgetPasswordScreen extends HookWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {

    //it will compute once and reuse it
    final formKey = useMemoized(() => GlobalKey<FormState>());

    final emailController = useTextEditingController();
    final isButtonEnable = useState<bool>(false);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          onChanged: () {
            isButtonEnable.value = (formKey.currentState?.validate() == true);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "FORGET PASSWORD",
                style: GoogleFonts.poppins(fontSize: 26),
              ),
              const Gap(15),
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
                enabled: isButtonEnable.value,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
