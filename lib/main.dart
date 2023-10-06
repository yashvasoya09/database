import 'package:database/screen/view/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => HomeScreen(),
      },
    ),
  );
}
