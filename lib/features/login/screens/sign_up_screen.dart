import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paper_trading/core/common_widgets/common_snackbar.dart';
import 'package:paper_trading/core/common_widgets/common_text_fields.dart';
import 'package:paper_trading/core/common_widgets/primary_button.dart';
import 'package:paper_trading/features/login/providers/authentication_provider.dart';
import 'package:paper_trading/utils/common_utils.dart';
import 'package:paper_trading/utils/string_constants.dart';

class SignUpScreen extends HookWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {

    //it will compute once and reuse it
    final formKey = useMemoized(() => GlobalKey<FormState>());

    final emailController = useTextEditingController();
    final nameController = useTextEditingController();
    final passwordController = useTextEditingController();

    final isButtonEnable = useState<bool>(false);
    final isShowPassword = useState<bool>(false);
    final isLoading = useState<bool>(false);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          onChanged: () {
            isButtonEnable.value = (formKey.currentState?.validate() == true);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Gap(kToolbarHeight),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "SIGN-UP",
                  style: GoogleFonts.poppins(fontSize: 26),
                ),
              ),
              const Gap(15),
              CommonTextFields(
                label: "Name",
                obscureText: true,
                controller: nameController,
                validator: (value) {
                  final valid = const CommonUtils().validateName(value);
                  return valid;
                },
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
              const Gap(50),
              Consumer(builder: (context, ref, _) {
                final authNotifier = ref.read(authenticationProviderProvider.notifier);
                return PrimaryButton(
                  buttonText: "Sign-up",
                  enabled: isButtonEnable.value,
                  isBusy: isLoading.value,
                  onPressed: () async {
                    if (formKey.currentState?.validate() == true) {
                      isLoading.value = true;
                      final userValue = await authNotifier.signUp(
                        nameController.text,
                        emailController.text,
                        passwordController.text,
                      );
                      isLoading.value = false;
                      if (!context.mounted) return;
                      if (userValue == null) {
                        CommonSnackBar.showSnackBar(
                            context: context,
                            backgroundColor: Colors.white,
                            msgColor: Colors.red,
                            msg: StringConstants.someThingWentWrong);
                      } else {
                        CommonSnackBar.showSnackBar(
                          context: context,
                          backgroundColor: Colors.white,
                          msgColor: Colors.green,
                          msg: 'User Created Successfully',
                        );
                        context.pop();
                      }
                    }
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
