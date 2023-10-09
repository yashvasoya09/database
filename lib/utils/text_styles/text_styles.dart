import 'package:database/utils/app_colors/app_colors.dart';
import 'package:database/utils/app_size/app_size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_colors/app_colors.dart';
import '../app_colors/app_colors.dart';

class TextStyles
{
  static final textStyles = TextStyles._();
  TextStyles._();
  TextStyle title = GoogleFonts.play(color: AppColors.appColor.secondaryColor,fontSize: w*6.5,);
  TextStyle appBarTitle = GoogleFonts.play(color: AppColors.appColor.secondaryColor,fontSize: w*6.5,fontWeight: FontWeight.w100);
  TextStyle subTitle = GoogleFonts.play(color: AppColors.appColor.primaryColor,fontSize: w*4.6);
  TextStyle paragraph = GoogleFonts.play(color: Colors.black,fontSize: w*2.9);
  
  Decoration primaryDecoration = BoxDecoration(color: AppColors.appColor.thiredColor,borderRadius: BorderRadius.circular(1.8*h));
}