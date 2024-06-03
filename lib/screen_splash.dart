import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'package:provider/provider.dart';
import 'package:student_app_provider/core/colors.dart';
import 'package:student_app_provider/provider/splash_provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<SplashProvider>(context, listen: false).goToLogin(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: maincolor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'STUDENT MANAGEMENT',
                style: GoogleFonts.dancingScript(
                  color: Colors.blueGrey.shade700,
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
              ),
              Lottie.asset(
                'Assets/Animation - 1717150533980.json',
                width: 270,
                height: 270,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
