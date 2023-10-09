import 'package:carousel_slider/carousel_slider.dart';
import 'package:database/screen/controller/qoutes_controller.dart';
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
      backgroundColor: AppColors.appColor.fourColor,
      // appBar: AppBar(
      //   title: Text("home Screen", style: TextStyles.textStyles.appBarTitle),
      //   centerTitle: true,
      //   backgroundColor: AppColors.appColor.primaryColor,
      // ),
      body: Padding(
        padding: EdgeInsets.all(h * 2.5),
        child: Column(
          children: [
            SizedBox(
              height: h * 1,
            ),
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
                    )),
              ),
            ),
            Row(
              children: [
                Text("Your Quotes", style: TextStyles.textStyles.title),
              ],
            ),
            Container(
              height: 20 * h,
              child: Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: TextStyles.textStyles.primaryDecoration,
                          alignment: Alignment.center,
                          height: 50 * h,
                          width: w * 40,
                          child: Text(
                              "${QuotesController.controller.QoutesList[index]}",
                              style: TextStyles.textStyles.subTitle),
                        ),
                      );
                    },
                    itemCount: QuotesController.controller.QoutesList.length),
              ),
            ),
            Row(
              children: [
                Text("Our Quotes", style: TextStyles.textStyles.title),
              ],
            ),
            Container(
              height: 20 * h,
              child: Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.center,
                          height: 50 * h,
                          width: w * 40,
                          decoration: TextStyles.textStyles.primaryDecoration,
                          child: Text(
                              "${QuotesController.controller.QoutesList[index]}",
                              style: TextStyles.textStyles.subTitle),
                        ),
                      );
                    },
                    itemCount: QuotesController.controller.QoutesList.length),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.appColor.primaryColor,
          onPressed: () {},
          child: Icon(Icons.add)),
    ));
  }
}
