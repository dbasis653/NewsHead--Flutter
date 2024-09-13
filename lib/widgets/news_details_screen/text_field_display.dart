import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldDisplay extends StatelessWidget {
  const TextFieldDisplay(
      {super.key, required this.textValue, required this.identifier});
  final String textValue;
  final String identifier;

  @override
  Widget build(BuildContext context) {
    TextStyle googleFonts = GoogleFonts.poppins(
        fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black);

    if (identifier == 'title') {
      googleFonts = GoogleFonts.poppins(
          fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black);
    }

    if (identifier == 'author' || identifier == 'source') {
      googleFonts = GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Theme.of(context).colorScheme.primary);
    }

    if (identifier == 'date') {
      googleFonts = GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Theme.of(context).colorScheme.primary);
    }

    return Text(
      textValue,
      style: googleFonts,
    );
  }
}
