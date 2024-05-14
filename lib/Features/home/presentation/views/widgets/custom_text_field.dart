import 'package:flutter/material.dart';
import '../../../../../core/utils/constants.dart';

class CustsomTextField extends StatelessWidget {
  const CustsomTextField({
    super.key,
    this.hint,
    this.maxlines = 1,
    this.onSaved,
    this.onChanged,
    this.controller,
  });

  final String? hint;
  final int maxlines;
  final void Function(String? value)? onSaved;
  final void Function(String? newValue)? onChanged;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return '$hint Field is Empty';
        }
        return null;
      },
      controller: controller,
      maxLines: maxlines,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          color: kPrimaryColor,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
