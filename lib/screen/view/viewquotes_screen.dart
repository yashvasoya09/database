import 'package:database/utils/app_size/app_size.dart';
import 'package:flutter/material.dart';

class ViewQuotesScreen extends StatefulWidget {
  const ViewQuotesScreen({super.key});

  @override
  State<ViewQuotesScreen> createState() => _ViewQuotesScreenState();
}

class _ViewQuotesScreenState extends State<ViewQuotesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        body: Container(
          height: 100*h,
          width: 100*w,
          child: Image.asset(
      "assets/images/bg1.png",
      fit: BoxFit.cover),
        ));
  }
}
