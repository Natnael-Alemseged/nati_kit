import 'package:flutter/services.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

/// A robust, reusable service for handling haptic feedback across the app.
/// This ensures consistent feel and allows for easy updates or disabling globally.
class HapticService {
  // Prevent instantiation
  HapticService._();

  /// Initialize haptics (check capabilities)
  static Future<void> init() async {
    // Optional: Check if device supports custom vibrations
    // bool canVibrate = await Vibrate.canVibrate;
  }

  /// Light impact (e.g., key press, small selection)
  static Future<void> light() async {
    await HapticFeedback.lightImpact();
  }

  /// Medium impact (e.g., form submission, toggle changed)
  static Future<void> medium() async {
    await HapticFeedback.mediumImpact();
  }

  /// Heavy impact (e.g., limit reached, delete action)
  static Future<void> heavy() async {
    await HapticFeedback.heavyImpact();
  }

  /// Success feedback (e.g., successful transaction, task complete)
  static Future<void> success() async {
    // Uses the platform's specific "success" pattern
    // If not available, falls back to medium impact
    try {
      Vibrate.feedback(FeedbackType.success);
    } catch (_) {
      await medium();
    }
  }

  /// Warning feedback (e.g., form validation error)
  static Future<void> warning() async {
    try {
      Vibrate.feedback(FeedbackType.warning);
    } catch (_) {
      await heavy();
    }
  }

  /// Error feedback (e.g., API failure, critical error)
  static Future<void> error() async {
    try {
      Vibrate.feedback(FeedbackType.error);
    } catch (_) {
      // Fallback: Double heavy impact
      await HapticFeedback.heavyImpact();
      await Future.delayed(const Duration(milliseconds: 100));
      await HapticFeedback.heavyImpact();
    }
  }

  /// Selection feedback (e.g., picker scroll, slider move)
  static Future<void> selection() async {
    await HapticFeedback.selectionClick();
  }
}
