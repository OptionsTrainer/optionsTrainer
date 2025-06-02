import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paper_trading/utils/extensions.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String buttonText;
  final bool enabled;
  final double height;
  final double? width;
  final bool reveredButton;
  final bool isBusy;
  final Color buttonBgColor;
  final FontWeight textFontWeight;
  final double textSize;

  const PrimaryButton({
    super.key,
    required this.buttonText,
    this.onPressed,
    this.enabled = true,
    this.width,
    this.height = 48,
    this.isBusy = false,
    this.reveredButton = false,
    this.buttonBgColor = Colors.white,
    this.textFontWeight = FontWeight.w400,
    this.textSize = 14,
  });

  factory PrimaryButton.reversed({
    VoidCallback? onPressed,
    required String buttonText,
    bool enabled = true,
    double? width,
    double height = 48,
  }) {
    return PrimaryButton(
      buttonText: buttonText,
      onPressed: onPressed,
      enabled: enabled,
      width: width,
      height: height,
      reveredButton: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    double btnWidth = width ?? MediaQuery.sizeOf(context).width;
    if (isBusy) {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        height: 48,
        width: 70,
        child: ElevatedButton(
          onPressed: null,
          style: ButtonStyle(
            padding:
                WidgetStateProperty.all<EdgeInsetsGeometry?>(EdgeInsets.zero),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            )),
          ),
          child: const Center(child: CircularProgressIndicator()),
        ),
      );
    }
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      width: btnWidth,
      height: height,
      child: ElevatedButton(
        onPressed: enabled ? onPressed : null,
        style: ButtonStyle(
          padding:
              WidgetStateProperty.all<EdgeInsetsGeometry?>(EdgeInsets.zero),
          backgroundColor: _ButtonBackgroundColor(
              reveredButton: reveredButton, backGroundColor: buttonBgColor),
          foregroundColor: _ButtonForegroundColor(reveredButton: reveredButton),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          )),
        ),
        child: Text(
          buttonText,
          style: GoogleFonts.poppins(
            fontSize: textSize,
            fontWeight: textFontWeight,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class _ButtonBackgroundColor implements WidgetStateProperty<Color?> {
  final bool reveredButton;
  final Color backGroundColor;

  const _ButtonBackgroundColor({
    required this.reveredButton,
    required this.backGroundColor,
  });

  @override
  Color? resolve(Set<WidgetState> states) {
    print("States:= $states");
    if (reveredButton) {
      if (states.isPressed) return Colors.grey[100];
      if (states.isDisabled) return Colors.grey[400];
      return Colors.white;
    } else {
      if (states.isPressed) return Colors.grey[100];

      if (states.isDisabled) return Colors.grey[400];

      return backGroundColor;
    }
  }
}

class _ButtonForegroundColor implements WidgetStateProperty<Color?> {
  final bool reveredButton;

  const _ButtonForegroundColor({
    required this.reveredButton,
  });

  @override
  Color? resolve(Set<WidgetState> states) {
    print("_ButtonForegroundColor:= $states");
    if (reveredButton) {
      if (states.isDisabled) return Colors.grey[400];
      return Colors.grey[400];
    } else {
      if (states.isDisabled) return Colors.grey[200];
      return Colors.white;
    }
  }
}
