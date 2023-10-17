import 'package:database/utils/db%20helper/db_helper.dart';
import 'package:get/get.dart';

class QuotesController extends GetxController {
  RxList<Map> data = <Map>[].obs;
  RxList<Map> categoryData = <Map>[].obs;
  RxList<Map> sortData = <Map>[].obs;
  Rxn<String> selectedItem = Rxn();
  Future<void> getData() async {
    data.value = await DbHelper.dbHelper.readDB();
  }
  Future<void> getCategoryData() async {
    categoryData.value =await DbHelper.dbHelper.readCategory();
  }
  Future<void> getSortData(category)
  async {
   sortData.value  = await DbHelper.dbHelper.getCategoryDataSort(category);
  }
  void updateData(model , id)
  {
    DbHelper.dbHelper.update(model: model, id: id);
  }
}
