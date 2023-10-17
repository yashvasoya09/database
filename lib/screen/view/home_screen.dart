import 'package:carousel_slider/carousel_slider.dart';
import 'package:database/screen/controller/qoutes_controller.dart';
import 'package:database/utils/app_size/app_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_colors/app_colors.dart';
import '../../utils/text_styles/text_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  QuotesController controller = Get.put(QuotesController());

  @override
  void initState() {
    super.initState();
    controller.getCategoryData();
    controller.getData();
  }

  @override
  Widget build(BuildContext context) {
    AppSize.appSize.size(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.appColor.fourColor,
        body: Padding(
          padding: EdgeInsets.all(h * 2.5),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: h * 20,
                  width: w * 100,
                  child: Container(
                    child: CarouselSlider(
                      items: [
                        Image.asset("assets/images/i1.png"),
                        Image.asset("assets/images/i2.png"),
                        Image.asset("assets/images/i3.png"),
                      ],
                      options: CarouselOptions(
                        aspectRatio: 16 / 9,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text("Your Quotes", style: TextStyles.textStyles.title),
                  ],
                ),
                Container(
                  height: 50 * h,
                  child: Obx(
                    () => GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                controller.getSortData(
                                    controller.categoryData[index]['category']);
                                Get.toNamed("/view");
                              },
                              child: Container(
                                decoration:
                                    TextStyles.textStyles.primaryDecoration,
                                alignment: Alignment.center,
                                height: 50 * h,
                                width: w * 40,
                                child: Text(
                                    "${controller.categoryData[index]['category']}",
                                    style: TextStyles.textStyles.subTitle),
                              ),
                            ),
                          );
                        },
                        itemCount: controller.categoryData.length),
                  ),
                ),
                SizedBox(height: h * 3),
                // AnimatedButton(
                //   backgroundColor: AppColors.appColor.secondaryColor,
                //   height: h * 6.5,
                //   width: w * 85,
                //   text: 'ADD CATEGORY',
                //   isReverse: true,
                //   selectedTextColor: AppColors.appColor.fourColor,
                //   transitionType: TransitionType.BOTTOM_TO_TOP,
                //   textStyle: GoogleFonts.nunito(
                //       fontSize: w * 5,
                //       letterSpacing: 5,
                //       color: AppColors.appColor.primaryColor,
                //       fontWeight: FontWeight.w300),
                //   onPress: () {
                //     Get.toNamed("/addcate");
                //   },
                // ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.appColor.primaryColor),
                    onPressed: () {
                      Get.toNamed("/addcate");
                    },
                    child: Text(
                      "ADD CATEGORY",
                      style: TextStyles.textStyles.title,
                    ))
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.appColor.primaryColor,
          onPressed: () {
            Get.toNamed("/add");
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
