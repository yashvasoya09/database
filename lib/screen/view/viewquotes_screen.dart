import 'package:database/screen/controller/qoutes_controller.dart';
import 'package:database/utils/app_size/app_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/text_styles/text_styles.dart';

class ViewQuotesScreen extends StatefulWidget {
  const ViewQuotesScreen({super.key});
  @override
  State<ViewQuotesScreen> createState() => _ViewQuotesScreenState();
}

class _ViewQuotesScreenState extends State<ViewQuotesScreen> {
  QuotesController controller =Get.put(QuotesController());
  @override
  void initState() {
    super.initState();
  controller.getData();
  }
  @override
  Widget build(BuildContext context) {
  int index = Get.arguments;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 100 * h,
            width: 100 * w,
            child: Image.asset(
              "assets/images/bg1.png",
              fit: BoxFit.cover,
            ),
          ),
           Center(
                    child: Obx(
                      () =>  controller.data.length==0?Text("data no found"):Text(
                        "${controller.data[index]['quote']}",
                        style: TextStyles.textStyles.viewTitle,
                      ),
                    ),
                  ),
        ],
      ),
    );
  }
}
