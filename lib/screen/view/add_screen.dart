import 'package:database/utils/app_colors/app_colors.dart';
import 'package:database/utils/app_size/app_size.dart';
import 'package:database/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/db helper/db_helper.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  TextEditingController txtquote = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.appColor.fourColor,
      appBar: AppBar(
          backgroundColor: AppColors.appColor.primaryColor,
          title: Text('Add Qoutes', style: TextStyles.textStyles.appBarTitle)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 2 * h,
            ),
            TextField(
              controller: txtquote,
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
        AnimatedButton(
          backgroundColor: AppColors.appColor.secondaryColor,
          height: h*6.5,
          width: w*35,
          text: 'SUBMIT',
          isReverse: true,
          selectedTextColor: AppColors.appColor.fourColor,
          transitionType: TransitionType.BOTTOM_TO_TOP,
          textStyle: GoogleFonts.nunito(
              fontSize: w*5,
              letterSpacing: 5,
              color: AppColors.appColor.primaryColor,
              fontWeight: FontWeight.w300), onPress: () {

            var quote = txtquote.text;
          DbHelper.dbHelper.insertDB(quote: quote);

        },
        ),
          ],
        ),
      ),
    ));
  }
}
