import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pro/UI/screen/auth/login.dart';
import 'package:pro/UI/screen/groups/group_screen.dart';
import 'package:pro/services/Auth/auth_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer t;

  @override
  void initState() {
    t = Timer(
      Duration(seconds: 2),
      () async {
        String token = await AuthServices.getToken()??"";
        bool verfiy = await AuthServices.userVerfiy() ?? false;

        if (token == null || token == "") {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ));
        } else if (token != "" && !verfiy) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ));
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => GroupScreen(),
              ));
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/images/R.png",
          height: 70,
          width: 70,
        ),
      ),
    );
  }
}
