import 'package:database/screen/controller/qoutes_controller.dart';
import 'package:database/screen/model/quotes_model.dart';
import 'package:database/utils/app_colors/app_colors.dart';
import 'package:database/utils/app_size/app_size.dart';
import 'package:database/utils/db%20helper/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/text_styles/text_styles.dart';

class ViewQuotesScreen extends StatefulWidget {
  const ViewQuotesScreen({super.key});

  @override
  State<ViewQuotesScreen> createState() => _ViewQuotesScreenState();
}

class _ViewQuotesScreenState extends State<ViewQuotesScreen> {
  QuotesController controller = Get.put(QuotesController());

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.appColor.fourColor,
        body: Obx(
          () => ListView.builder(
            itemBuilder: (context, index) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/bg1.png"))),
                    height: 15 * h,
                    width: 80 * w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 2 * h,
                        ),
                        Center(
                            child: Text(
                                "${controller.sortData[index]['quote']}",
                                style: TextStyles.textStyles.title)),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                Get.toNamed("/update", arguments: index);
                              },
                              icon: Icon(Icons.add,color: AppColors.appColor.thiredColor),
                            ),
                            IconButton(
                              onPressed: () {
                                DbHelper.dbHelper
                                    .deleteData(controller.sortData[index]['id']);
                                controller.getSortData(
                                    controller.categoryData[index]['category']);
                              },
                              icon: Icon(Icons.delete,color: Colors.red,),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 0.3 * h,
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
            itemCount: controller.sortData.length,
          ),
        ));
  }
}
