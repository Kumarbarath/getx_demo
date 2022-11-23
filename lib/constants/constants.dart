import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Style{

  static TextStyle customStyle({ Color? color,  double? fontSize,
    FontWeight? fontWeight,}){

    return GoogleFonts.poppins(
      fontSize:fontSize ,
      fontWeight: fontWeight,
      color: color,
    );
  }
}