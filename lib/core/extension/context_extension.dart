import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  // general size
  Size get size => MediaQuery.of(this).size;
  // general height
  double get screenHeight => MediaQuery.of(this).size.height;
  // general height
  double get screenWidth => MediaQuery.of(this).size.width;
  double get safeAreaHorizontal =>
      screenWidth -
      MediaQuery.of(this).padding.left -
      MediaQuery.of(this).padding.right;
  double get safeAreaVertical =>
      screenHeight -
      MediaQuery.of(this).padding.top -
      MediaQuery.of(this).padding.bottom;
}
