import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static final dbHelper = DbHelper._();

  DbHelper._();

  var databaseName = 'quotesDB.db';
  var tableName = 'quotes';

  Database? database;

  Future<Database?> checkDB() async {
    if (database != null) {
      return database;
    } else {
      return await createDB();
    }
  }

  Future<Database> createDB() async {
    Directory directory =await  getApplicationDocumentsDirectory();
    String path = join(directory.path, databaseName);
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        String query =
            "CREATE TABLE $tableName(id INTERGER PRIMARY KEY AUTOINCREMENT,quote TEXT)";
        database!.execute(query);
      },
    );
  }

  Future<void> insertDB({required quote}) async {
    database = await checkDB();
    database!
        .insert(tableName, {'quote': quote});
  }

  Future<List<Map>> readDB() async {
    database = await checkDB();
    String query = "SELECT * FROM quote";
    List<Map> dataList = await database!.rawQuery(query);
    return dataList;
  }
}
