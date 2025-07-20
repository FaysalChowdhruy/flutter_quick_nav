library flutter_quick_nav;

import 'package:flutter/material.dart';

/// A lightweight Flutter navigation utility package.
///
/// Provides simplified methods to navigate between screens
/// using fade animations and common navigation patterns.
class FlutterQuickNav {
  /// Pushes a new screen with a fade transition.
  static Future<T?> push<T extends Object?>(
      BuildContext context, Widget screen) {
    return Navigator.push<T>(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => screen,
        transitionsBuilder: (_, animation, __, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    );
  }

  /// Replaces the current screen with the given one.
  static Future<T?> replace<T extends Object?, TO extends Object?>(
      BuildContext context, Widget screen) {
    return Navigator.pushReplacement<T, TO>(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  /// Pushes a screen and removes all previous screens until [untilRoute].
  ///
  /// Defaults to removing until `/Home`.
  static Future<T?> pushAndRemoveUntil<T extends Object?>(
    BuildContext context,
    Widget screen, {
    String untilRoute = '/Home',
  }) {
    return Navigator.pushAndRemoveUntil<T>(
      context,
      MaterialPageRoute(builder: (_) => screen),
      ModalRoute.withName(untilRoute),
    );
  }
}
