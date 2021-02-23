import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'delivery_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DeliveryPage(),
      theme: ThemeData(
        accentColor: Colors.white,
        primaryColor: Colors.white,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
