import 'package:flutter/material.dart';

import '../utils/app_constants.dart';

Container customTextField({
  required String labelText,
  required TextEditingController textEditingController,
  required FocusNode focusNode,
  TextInputType? textInputType,
  int? maxLines,
}) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    child: TextField(
      focusNode: focusNode,
      controller: textEditingController,
      keyboardType: textInputType,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: AppConstants.primaryColor),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppConstants.primaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppConstants.primaryColor),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppConstants.primaryColor),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    ),
  );
}
