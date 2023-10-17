import 'package:database/screen/view/add_category.dart';
import 'package:database/screen/view/add_screen.dart';
import 'package:database/screen/view/home_screen.dart';
import 'package:database/screen/view/update_screen.dart';
import 'package:database/screen/view/viewquotes_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => const HomeScreen(),
        '/view':(context) => const ViewQuotesScreen(),
        '/add':(context) => const AddScreen(),
        '/addcate':(context) => const AddCategory(),
        '/update':(context) => const UpdateScreen(),
      },
    ),
  );
}
