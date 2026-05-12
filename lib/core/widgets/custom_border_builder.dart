import 'package:flutter/material.dart';

InputBorder borderBuilder({Color color = Colors.white, double radius = 0}) {
  return OutlineInputBorder(
    borderSide: BorderSide(color: color),
    borderRadius: BorderRadius.circular(radius),
  );
}
