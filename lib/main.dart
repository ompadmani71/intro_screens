import 'package:flutter/material.dart';
import 'package:one_time_splash_screen/screen/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'intro_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool? isIntroShow = prefs.getBool("isIntroShow") ?? true;
  runApp(
    MaterialApp(
      initialRoute: (isIntroShow) ? "intro_page" : "/",
      theme: ThemeData(
        primaryColor: Color(0xff91c57a),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const HomeScreen(),
        "intro_page": (context) => const IntroPages(),
      },
    ),
  );
}
