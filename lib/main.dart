import 'package:database/screen/view/add_screen.dart';
import 'package:database/screen/view/home_screen.dart';
import 'package:database/screen/view/viewquotes_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => HomeScreen(),
        '/view':(context) => ViewQuotesScreen(),
        '/add':(context) => AddScreen(),
      },
    ),
  );
}
