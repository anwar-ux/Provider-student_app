import 'package:flutter/material.dart';
import 'package:student_app_provider/screens/home/home.dart';


class SplashProvider extends ChangeNotifier {
  Future<void> goToLogin(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) =>const Home(),
      ),
    );
  }
}
