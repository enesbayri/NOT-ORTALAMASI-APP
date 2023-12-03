import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types
class sabitler {
  static List<Color> renkler = [
    Colors.amber,
    Colors.blue,
    Colors.blueGrey,
    Colors.brown,
    Colors.cyan,
    Colors.deepOrange,
    Colors.deepPurple,
    Colors.green,
    Colors.indigo,
    Colors.lightBlue,
    Colors.lime,
    Colors.pink,
    Colors.red,
    Colors.teal,
    Colors.yellow,
  ];
  static MaterialColor anarenk = Colors.indigo;
  static Color inputArkaplan = anarenk.shade100.withOpacity(0.3);
  static String baslikText = "Ortalama Hesapla";
  static TextStyle baslikTextStyle = GoogleFonts.quicksand(
      fontSize: 24, fontWeight: FontWeight.w900, color: anarenk);
  static TextStyle ortalamaBodyStyle = GoogleFonts.quicksand(
      fontSize: 55, fontWeight: FontWeight.w800, color: anarenk);
  static TextStyle ortalamaDerStyle = GoogleFonts.quicksand(
      fontSize: 16, fontWeight: FontWeight.w600, color: anarenk);
      
}
