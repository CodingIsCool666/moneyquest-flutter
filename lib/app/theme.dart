import 'package:flutter/material.dart';

ThemeData buildTheme(Brightness brightness) {
  final isDark = brightness == Brightness.dark;
  final base = isDark ? ThemeData.dark(useMaterial3: true)
                      : ThemeData.light(useMaterial3: true);

  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      primary: Colors.teal,
      secondary: Colors.orange,
    ),
    // Dont scale fonts here to avoid the assertion.
    textTheme: base.textTheme,
  );
}
