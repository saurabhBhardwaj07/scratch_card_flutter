import 'package:flutter/material.dart';
import 'package:scratch_card/core/app_exports.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLargeOnPrimaryContainer => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      );
  // Title text style
  static get titleMediumBold => theme.textTheme.titleMedium!.copyWith(
        fontSize: 18.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumBold_1 => theme.textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.w700,
      );

  static get titleMediumBoldPrimary => theme.textTheme.titleMedium!
      .copyWith(fontWeight: FontWeight.w700, color: theme.colorScheme.primary);

  static get titleMediumPrimaryContainer =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primaryContainer,
        fontWeight: FontWeight.w700,
      );
}

extension on TextStyle {
  TextStyle get splineSans {
    return copyWith(
      fontFamily: 'Spline Sans',
    );
  }
}
