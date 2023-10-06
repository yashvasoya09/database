import 'package:database/utils/app_size/app_size.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors/app_colors.dart';
import '../../utils/text_styles/text_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    AppSize.appSize.size(context);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("home Screen",style: TextStyles.textStyles.title),
        centerTitle: true,
        backgroundColor: AppColors.appColor.primaryColor,
      ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Center(child: Container(height: h*10,width: w*100,color: Colors.red,)),
                Center(child: Container(height: h*10,width: w*100,color: Colors.amber,)),
              ],
            ),
          ),
    ));
  }
}
