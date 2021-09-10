import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart'; import 'dart:io';

class DataBaseHelper {
  static Database _db;

  static Future<Database> getdb() async {
    if (_db != null) {
      return _db;
    } else {
      _db = await OpenDb();
      return _db;
    }
  }

  static Future<Database> OpenDb() async {
    Directory dir = await getApplicationDocumentsDirectory(); String path = join(dir.path, 'Userdb.db');

    var Userdb = await openDatabase(path, version: 1, onCreate:
    _FirstCreate);

    return Userdb;
  }
  static void Restart() async {
    Directory dir = await getApplicationDocumentsDirectory(); String path = join(dir.path, 'Userdb.db');
    File f = new File(path);

    if (!f.existsSync()) { deleteDatabase(path); print("DataBase has deleted");
    }
  }

  static void _FirstCreate(Database db, int version) async {
    var CreateUserTableStatment = "create table User(Id INTEGER PRIMARY KEY AUTOINCREMENT NOTNULL,Username Text,Password Text)";

    await db.execute(CreateUserTableStatment);
  }

  static Future<void> CloseDb() async {
    var db = await getdb(); db.close();
    _db = null;
  }
}
