import 'package:flutter/material.dart';

import '../../../../../core/utils/constants.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar(
      {super.key,
      required this.onChanged,
      required this.onClose,
      required this.controller});

  final void Function(String value) onChanged;
  final void Function() onClose;
  final TextEditingController controller;

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onChanged,
      controller: widget.controller,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: widget.onClose,
          icon: const Icon(
            Icons.close,
          ),
        ),
        hintText: 'Title',
        hintStyle: const TextStyle(
          color: kPrimaryColor,
        ),
        contentPadding: const EdgeInsets.all(16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
