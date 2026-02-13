import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isBusy;
  final bool disabled;
  final bool outline;
  final Color? backgroundColor;
  final Color? textColor;
  final TextStyle? textStyle;
  final double height;
  final double? width;
  final double borderRadius;
  final Widget? icon;
  final double borderWidth;
  final Color? borderColor;

  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isBusy = false,
    this.disabled = false,
    this.outline = false,
    this.backgroundColor,
    this.textColor,
    this.textStyle,
    this.height = 56,
    this.width,
    this.borderRadius = 12,
    this.icon,
    this.borderWidth = 1.5,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    final isEnabled = !disabled && !isBusy && onPressed != null;

    // Determine effective colors
    final effectiveBackgroundColor =
        outline ? Colors.transparent : (backgroundColor ?? kcPrimaryColor);

    final effectiveTextColor =
        textColor ?? (outline ? kcPrimaryColor : kcWhite);

    final effectiveBorderColor = borderColor ?? kcPrimaryColor;

    return SizedBox(
      height: height,
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: isEnabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: effectiveBackgroundColor,
          disabledBackgroundColor: outline ? Colors.transparent : kcLightGrey,
          foregroundColor: effectiveTextColor,
          elevation: outline ? 0 : 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: outline
                ? BorderSide(
                    color: isEnabled ? effectiveBorderColor : kcLightGrey,
                    width: borderWidth)
                : BorderSide.none,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
        ),
        child: isBusy
            ? SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(effectiveTextColor),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) ...[
                    icon!,
                    const SizedBox(width: 8),
                  ],
                  Text(
                    text,
                    style: textStyle ??
                        TextStyle(
                          color: isEnabled ? effectiveTextColor : kcMediumGrey,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
      ),
    );
  }
}
