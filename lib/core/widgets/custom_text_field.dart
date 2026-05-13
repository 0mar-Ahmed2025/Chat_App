import 'package:chat_app/core/helper/app_validator.dart';
import 'package:chat_app/core/widgets/custom_border_builder.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, this.lableText, this.onChanged});
  final String? lableText;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      validator: AppValidator.validator,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: lableText,
        labelStyle: TextStyle(color: Colors.white),
        enabledBorder: borderBuilder(),
        focusedBorder: borderBuilder(color: Colors.blue),
        errorBorder: borderBuilder(color: Colors.red),
        focusedErrorBorder: borderBuilder(color: Colors.red),
      ),
    );
  }
}
