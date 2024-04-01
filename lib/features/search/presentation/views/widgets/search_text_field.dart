import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
        hintText: 'Search',
        hintStyle: const TextStyle(color: Colors.white),
        border: borderBuilder(),
        enabledBorder: borderBuilder(Colors.grey.shade700),
        focusedBorder: borderBuilder(Colors.grey.shade700),
      ),
    );
  }
}

OutlineInputBorder borderBuilder([color]) {
  return OutlineInputBorder(
    borderSide: BorderSide(color: color ?? Colors.white),
    borderRadius: BorderRadius.circular(8),
  );
}
