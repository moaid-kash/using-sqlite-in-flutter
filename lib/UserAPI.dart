
import 'package:back/DataBaseHelper.dart';
import 'package:back/User.dart';

class UserAPI {
  static Future<int> AddUser(User user) async { var db = await DataBaseHelper.getdb(); Map<String, dynamic> UserMap = new Map(); UserMap["Username"] = user.getUsername(); UserMap["Password"] = user.getPassword();
  int result = await db.insert("User", UserMap);

  return 0;
  }

  static Future<List> GetAllUser() async {
    var db = await DataBaseHelper.getdb();
    String SelectAllUserStatment = "Select * from User"; List result = await db.rawQuery(SelectAllUserStatment);

    return result.toList();
  }

  static Future<int> EditUser(User user) async {
    var db = await DataBaseHelper.getdb();
    Map<String, dynamic> UserMap = new Map(); UserMap["Username"] = user.getUsername(); UserMap["Password"] = user.getPassword(); UserMap["Id"] = user.getId();
    int result = await db
        .update("user", UserMap, where: "Id=?", whereArgs: [user.getId()]);

    return result;
  }

  static Future<int> DeleteUser(int Id) async {
    var db = await DataBaseHelper.getdb();

    int result = await db.delete("user", where: "Id=${Id}"); return result;
  }

  static Future<void> DeleteAllUser() async { var db = await DataBaseHelper.getdb(); db.execute("delete from user");
  }
}
