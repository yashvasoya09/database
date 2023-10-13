import 'package:database/utils/db%20helper/db_helper.dart';
import 'package:get/get.dart';

class QuotesController extends GetxController {
  List qoutesList = [
    "happy",
    "motivation",
    "sad",
  ];
  RxList<Map> data = <Map>[].obs;
  RxList<Map> categorydata = <Map>[].obs;
  Rxn<String> selectedItem = Rxn();
  Future<void> getData() async {
    data.value = await DbHelper.dbHelper.readDB();
  }
  Future<void> getCategoryData() async {
    categorydata.value =await DbHelper.dbHelper.readCategory();
  }
}
