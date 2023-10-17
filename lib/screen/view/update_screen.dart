import 'package:database/screen/controller/qoutes_controller.dart';
import 'package:database/utils/app_colors/app_colors.dart';
import 'package:database/utils/app_size/app_size.dart';
import 'package:database/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/quotes_model.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  TextEditingController txtquote = TextEditingController();
  QuotesController controller = Get.put(QuotesController());
  int index = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.appColor.fourColor,
        appBar: AppBar(
            backgroundColor: AppColors.appColor.primaryColor,
            title:
            Text('Update Quotes', style: TextStyles.textStyles.appBarTitle)),
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
                    hintText: 'Enter Our Quotes',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide:
                        BorderSide(color: AppColors.appColor.primaryColor)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                            width: 2, color: AppColors.appColor.primaryColor))),
              ),
              SizedBox(
                height: h * 2,
              ),
              Obx(
                    () =>  DropdownButton(
                  value: controller.selectedItem.value,
                  items: controller.categoryData
                      .map((e) => DropdownMenuItem(child: Text("${e['category']}"),value: e['category'],))
                      .toList(),
                  onChanged: (value) {
                    controller.selectedItem.value=value as String;
                  },
                ),
              ),
              SizedBox(
                height: 2 * h,
              ),
              SizedBox(
                height: 3 * h,
              ),
              ElevatedButton(onPressed: (){
                var id = controller.sortData[index]['id'];
                var quote = txtquote.text;
                var category = controller.selectedItem.value;
                QuotesModel model = QuotesModel(quote, category);
                controller.updateData(model, id);
                controller.getSortData(category);
                Get.back();
              }, child: Text("SUBMIT",style: TextStyles.textStyles.title,))
            ],
          ),
        ),
      ),
    );
  }
}
