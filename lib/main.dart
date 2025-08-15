import 'package:flutter/material.dart';
import 'splash_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color(0xff6366f1)),
      home: const SplashScreen(),
    ),
  );
}
