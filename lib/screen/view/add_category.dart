import 'package:database/screen/controller/qoutes_controller.dart';
import 'package:database/utils/app_size/app_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_colors/app_colors.dart';
import '../../utils/db helper/db_helper.dart';
import '../../utils/text_styles/text_styles.dart';

class AddCategory extends StatefulWidget {
  const AddCategory({super.key});

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  TextEditingController txtcate = TextEditingController();
  QuotesController controller = Get.put(QuotesController());


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.appColor.fourColor,
        appBar: AppBar(
          backgroundColor: AppColors.appColor.primaryColor,
          centerTitle: true,
          title: const Text("Add Category"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 2 * h,
              ),
              TextField(
                controller: txtcate,
                decoration: InputDecoration(
                    hintText: 'Enter Our Qoutes',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: AppColors.appColor.primaryColor
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(width: 2,color: AppColors.appColor.primaryColor))),
              ),

              SizedBox(height: 3*h,),
              // AnimatedButton(
              //   backgroundColor: AppColors.appColor.secondaryColor,
              //   height: h*6.5,
              //   width: w*35,
              //   text: 'SUBMIT',
              //   isReverse: true,
              //   selectedTextColor: AppColors.appColor.fourColor,
              //   transitionType: TransitionType.BOTTOM_TO_TOP,
              //   textStyle: GoogleFonts.nunito(
              //       fontSize: w*5,
              //       letterSpacing: 5,
              //       color: AppColors.appColor.primaryColor,
              //       fontWeight: FontWeight.w300), onPress: () {
              //
              //   var category = txtcate.text;
              //   DbHelper.dbHelper.insertCategory(category);
              //   controller.getCategoryData();
              //   Get.back();
              //
              // },
              // ),
              //
              ElevatedButton(onPressed: () {
                var category = txtcate.text;
                DbHelper.dbHelper.insertCategory(category);
                controller.getCategoryData();
                Get.back();
              }, child: Text("SUBMIT",style: TextStyles.textStyles.title,))
            ],
          ),
        ),
      ),
    );
  }
}
