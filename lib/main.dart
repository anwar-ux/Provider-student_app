import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:student_app_provider/provider/add_page_provider.dart';
import 'package:student_app_provider/provider/details_page_provider.dart';
import 'package:student_app_provider/provider/edit_page_provider.dart';
import 'package:student_app_provider/provider/home_page_provider.dart';
import 'package:student_app_provider/provider/splash_provider.dart';
import 'package:student_app_provider/screen_splash.dart';
import 'package:student_app_provider/screens/home/home.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
        ChangeNotifierProvider(create: (_) => StudentDetailProvider()),
        ChangeNotifierProvider(create: (_)=>HomePageProvider()),
        ChangeNotifierProvider(create: (_)=>AddPageProvider()),
        ChangeNotifierProvider(create: (_)=>EditPageProvider()),
        ChangeNotifierProvider(create: (_)=>SplashProvider())

    ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: GoogleFonts.crimsonPro().fontFamily,
         textTheme: const TextTheme(
          titleSmall: TextStyle(color: Colors.white),
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
          bodySmall: TextStyle(color: Colors.white),
         ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:const SplashScreen(),
      ),
    );
  }
}

