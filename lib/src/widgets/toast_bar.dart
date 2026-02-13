import '../utils/haptic_service.dart'';
import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:delightful_toast/toast/utils/enums.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

enum ToastType { danger, warning, success, info }

void showToast({
  required BuildContext context,
  required String message,
  ToastType type = ToastType.info,
  int durationSeconds = 3,
  bool autoDismiss = true,
  DelightSnackbarPosition position = DelightSnackbarPosition.top,
  bool withHaptics = false,
}) {
  // Define style properties based on ToastType
  IconData icon;
  Color color;
  Color iconColor;

  switch (type) {
    case ToastType.danger:
      icon = Icons.error_outline_rounded;
      color = kcRed;
      iconColor = kcWhite;
      if (withHaptics) HapticService.error();
      break;
    case ToastType.warning:
      icon = Icons.warning_amber_rounded;
      color = Colors.orange;
      iconColor = kcWhite;
      if (withHaptics) HapticService.warning();
      break;
    case ToastType.success:
      icon = Icons.check_circle_outline_rounded;
      color = kcGreen;
      iconColor = kcWhite;
      if (withHaptics) HapticService.success();
      break;
    case ToastType.info:
      icon = Icons.info_outline_rounded;
      color = kcBlack; // Or a neutral blue/grey
      iconColor = kcWhite;
      if (withHaptics) HapticService.light();
      break;
  }

  DelightToastBar(
    snackbarDuration: Duration(seconds: durationSeconds),
    autoDismiss: autoDismiss,
    position: position,
    builder: (context) => ToastCard(
      color: color,
      shadowColor: Colors.black12,
      leading: Icon(icon, color: iconColor, size: 24),
      title: Text(
        message,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14,
          color: kcWhite,
        ),
      ),
    ),
  ).show(context);
}

// Deprecated wrapper for backward compatibility if needed,
// but encourage moving to showToast
void toastBar({
  required BuildContext context,
  required String message,
  required ToastType type,
  int seconds = 2,
  bool willAutoDismiss = true,
}) {
  showToast(
    context: context,
    message: message,
    type: type,
    durationSeconds: seconds,
    autoDismiss: willAutoDismiss,
  );
}
