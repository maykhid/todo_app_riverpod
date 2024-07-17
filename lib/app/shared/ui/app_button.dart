import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_riverpod/app/shared/ui/app_colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.text,
    this.icon,
    this.onPressed,
    this.backgroundColor,
    this.buttonTextStyle,
    this.width,
    this.height,
    this.borderRadius,
    this.isLoading = false,
    this.borderSide = BorderSide.none,
    super.key,
  });

  final String text;
  final Color? backgroundColor;
  final TextStyle? buttonTextStyle;
  final double? width;
  final double? height;
  final double? borderRadius;
  final Widget? icon;
  final bool isLoading;
  final BorderSide borderSide;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    const defaultTextStyle = TextStyle(
      fontSize: 16,
      color: Colors.white,
    );
    return ElevatedButton.icon(
      onPressed: isLoading ? null : onPressed,
      icon: icon ?? const SizedBox.shrink(),
      label: isLoading
          ? const CupertinoActivityIndicator(
              color: Colors.white,
            )
          : Text(
              text,
              style: buttonTextStyle ?? defaultTextStyle,
            ),
      style: ElevatedButton.styleFrom(
          fixedSize: Size(width ?? 240, height ?? 50),
          shape: RoundedRectangleBorder(
            side: borderSide,
            borderRadius: BorderRadius.circular(
              borderRadius ?? 6,
            ), // Set border radius here
          ),
          backgroundColor: backgroundColor ??
              AppColors.lightBlue, // Change the color for Google button
          disabledBackgroundColor:
              (backgroundColor ?? AppColors.lightBlue).withOpacity(0.5)),
    );
  }
}
