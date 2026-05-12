import 'package:flutter/material.dart';

abstract class AppPopUp {
  static void showSnackBar(
    BuildContext context,
    String message, {
    Color color = Colors.red,
  }) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(backgroundColor: color, content: Text(message)));
  }
}
