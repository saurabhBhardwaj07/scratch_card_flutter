import 'package:flutter/material.dart';

extension ColorExtension on Color {
  Divider divider({double thickness = 1.2}) {
    return Divider(
      color: this,
      thickness: thickness,
    );
  }
}
