 import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildTextField({
    required String hint,
    required TextEditingController controller,
    required TextInputType keyboardType,
    required String? Function(String?)? validator,
  }) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      keyboardType: keyboardType,
      style: const TextStyle(
        fontSize: 18,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.dancingScript(
          fontSize: 18,
          color: Colors.blueGrey.shade700,
          fontWeight: FontWeight.bold,
        ),
        filled: true,
        fillColor: Colors.cyan.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      validator: validator,
    );


  }