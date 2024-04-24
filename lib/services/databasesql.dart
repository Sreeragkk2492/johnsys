import 'package:johnsys/model/usermodel.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart';
import 'package:sqflite/sqlite_api.dart';

class SqlHelper {
  static Future<sql.Database> opendb() async {
    return await sql.openDatabase(
      'user',
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            'CREATE TABLE user(id INTEGER PRIMARY KEY,username TEXT,password TEXT)');
      },
    );
  }

  static Future<void> insertuser(User user) async {
    final db = await opendb();
     await db.insert(
      'user',
      user.tomap(),
    );
   
  }

  static Future<List<User>> getuser(String username, String password) async {
    final db = await opendb();
    List<Map<String, Object?>> usermap = await db.query(
      'user',
    orderBy: 'id'
    ); 

    return usermap.map((usermap) => User.fromMap(usermap)).toList();
  }
}
