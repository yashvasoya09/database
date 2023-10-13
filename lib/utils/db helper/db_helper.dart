import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static final dbHelper = DbHelper._();

  DbHelper._();

  var databaseName = 'quotesDB.db';
  var tableName = 'quotes';
  var categoryTable = 'categoryTable';

  Database? database;

  Future<Database?> checkDB() async {
    if (database != null) {
      return database;
    } else {
      return await createDB();
    }
  }

  Future<Database> createDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, databaseName);
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        String query =
            "CREATE TABLE $tableName(id INTEGER PRIMARY KEY AUTOINCREMENT,quote TEXT,category TEXT)";
        String query2 =
            "CREATE TABLE $categoryTable(id INTEGER PRIMARY KEY AUTOINCREMENT,category TEXT)";
        db.execute(query);
        db.execute(query2);
      },
    );
  }

  Future<void> insertDB({required quote,required category}) async {
    database = await checkDB();
    database!.insert(tableName, {'quote': quote,'category':category});
  }

  Future<List<Map>> readDB() async {
    database = await checkDB();
    String query = "SELECT * FROM $tableName";
    List<Map> dataList = await database!.rawQuery(query);
    print("${dataList[0]}");
    return dataList;
  }

// category
  Future<void> insertCategory(category) async {
    database = await checkDB();
    database!.insert(categoryTable, {'category': category});
  }
  Future<List<Map>> readCategory() async {
    database = await checkDB();
    String query = "SELECT * FROM $categoryTable";
    List<Map> dataList = await database!.rawQuery(query);
    return dataList;
  }
}
