library flutter_quick_nav;

import 'package:flutter/material.dart';

/// Available transition types
enum TransitionType { fade, slideLeft, slideRight, slideUp, slideDown, scale, rotate }


/// Navigation helper class
class FlutterQuickNav {
  /// Push a new page with animation
  static Future<T?> push<T extends Object?>(
      BuildContext context,
      Widget screen, {
        TransitionType type = TransitionType.fade,
        Duration duration = const Duration(milliseconds: 300),
        Curve curve = Curves.easeInOut,
      }) {
    return Navigator.push<T>(
      context,
      _animatedRoute(screen, type, duration, curve) as Route<T>,
    );
  }

  /// Replace current page with another
  static Future<T?> replace<T extends Object?, TO extends Object?>(
      BuildContext context,
      Widget screen, {
        TransitionType type = TransitionType.fade,
        Duration duration = const Duration(milliseconds: 300),
        Curve curve = Curves.easeInOut,
      }) {
    return Navigator.pushReplacement<T, TO>(
      context,
      _animatedRoute(screen, type, duration, curve) as Route<T>,
    );
  }

  /// Push a screen and remove all previous routes until [untilRoute]
  static Future<T?> pushAndRemoveUntil<T extends Object?>(
      BuildContext context,
      Widget screen, {
        String? untilRoute,
        TransitionType type = TransitionType.fade,
        Duration duration = const Duration(milliseconds: 300),
        Curve curve = Curves.easeInOut,
      }) {
    return Navigator.pushAndRemoveUntil<T>(
      context,
      _animatedRoute(screen, type, duration, curve) as Route<T>,
      untilRoute == null ? (route) => false : ModalRoute.withName(untilRoute),
    );
  }

  /// Pop the current screen
  static void pop<T extends Object?>(BuildContext context, [T? result]) {
    if (Navigator.canPop(context)) {
      Navigator.pop<T>(context, result);
    }
  }

  /// Create animated route based on [TransitionType]
  static PageRouteBuilder _animatedRoute(
      Widget page,
      TransitionType type,
      Duration duration,
      Curve curve,
      ) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => page,
      transitionDuration: duration,
      transitionsBuilder: (_, animation, __, child) {
        final curved = CurvedAnimation(parent: animation, curve: curve);

        switch (type) {
          case TransitionType.fade:
            return FadeTransition(opacity: curved, child: child);
          case TransitionType.slideLeft:
            return SlideTransition(
              position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero).animate(curved),
              child: child,
            );
          case TransitionType.slideRight:
            return SlideTransition(
              position: Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero).animate(curved),
              child: child,
            );
          case TransitionType.slideUp:
            return SlideTransition(
              position: Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero).animate(curved),
              child: child,
            );
          case TransitionType.slideDown:
            return SlideTransition(
              position: Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero).animate(curved),
              child: child,
            );
          case TransitionType.scale:
            return ScaleTransition(scale: curved, child: child);
          case TransitionType.rotate:
            return RotationTransition(turns: curved, child: child);
          }


      },
    );
  }
}
