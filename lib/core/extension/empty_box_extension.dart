import 'package:flutter/material.dart';

extension emptySpace on num {
  SizedBox get sbH => SizedBox(height: toDouble());
  SizedBox get sbW => SizedBox(width: toDouble());
}
