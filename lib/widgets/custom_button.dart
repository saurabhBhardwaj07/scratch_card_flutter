import 'package:flutter/material.dart';
import 'package:scratch_card/core/app_exports.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.decoration,
    this.leftIcon,
    this.rightIcon,
    this.buttonTextStyle,
  });

  final BoxDecoration? decoration;
  final Widget? leftIcon;
  final String text;
  final void Function()? onPressed;
  final Widget? rightIcon;
  final TextStyle? buttonTextStyle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed ?? () {},
      child: Container(
        height: 48.v,
        width: double.maxFinite,
        decoration: decoration ??
            AppDecoration.fillPrimary.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder12,
            ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            leftIcon ?? const SizedBox.shrink(),
            Text(
              text,
              style: buttonTextStyle ??
                  CustomTextStyles.titleMediumPrimaryContainer,
            ),
            rightIcon ?? const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
