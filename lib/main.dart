import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro/UI/screen/auth/login.dart';
import 'package:pro/UI/screen/auth/splash_screen.dart';
import 'package:pro/UI/screen/main_screen.dart';
import 'package:pro/UI/screen/auth/register.dart';
import 'package:pro/core/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(

          textTheme: TextTheme(
            bodySmall: GoogleFonts.poppins(
              fontSize: 13,
            ),
            bodyLarge: GoogleFonts.poppins(
              fontSize: 16,
            ),
            bodyMedium: GoogleFonts.poppins(
              fontSize: 15,
            ),
          ),
          useMaterial3: true,
        ),
        home: SplashScreen());
  }
}
