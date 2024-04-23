import 'dart:async';

import 'package:flutter/material.dart';
import 'package:johnsys/controller/apihelper.dart';
import 'package:johnsys/model/johnsys.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CounterProvider extends ChangeNotifier {
// void increment(Johnsys john){
//   john.count++;
// }

  late Future<List<Johnsys>> _fetcheddata;

  late Database _database;

  CounterProvider(){
    initdatabase();
  }

  List<Johnsys> product = [];

  Future<List<Johnsys>> get fetcheddata => _fetcheddata;

  void fetchproduct() async {
    _fetcheddata = (await ApiHelper.fetchproduct()) as Future<List<Johnsys>>;
    if (_fetcheddata != null) {
      product = _fetcheddata as List<Johnsys>;
    }
    notifyListeners();
  }

  void increment(Johnsys john) {
    john.count++;
    calculateprice(john);
    notifyListeners();
  }

  void decrement(Johnsys john) {
    john.count--;
    calculateprice(john);
    notifyListeners();
  }

  calculateprice(Johnsys john) {
    // for (var ele in product) {
    //   ele.total = int.parse(ele.mrp.toString().trim()) * ele.count;
    //   notifyListeners();
    // }
    // return ;

    john.total = int.parse(john.mrp.toString().trim()) * john.count;
    return john.total;
  }
  
 Future <void> initdatabase() async{
  String path= join(await getDatabasesPath(),'user.db');
  _database=await openDatabase(path,onCreate: createdb,version: 1);
 }

  Future <void> createdb(Database db, int version) async{
    await db.execute('CREATE TABLE user(id INTEGER PRIMARY KEY AUTOINCREMENT,username TEXT,password TEXT)');
  }

  Future<void> registeruser(String username,String password)async{
  await _database.insert('user', {'username':username,'password':password});
  notifyListeners();
  }
   Future<void> loginUser(String username, String password) async {
    List<Map<String, dynamic>> user = await _database.query('user',
        where: 'username = ? AND password = ?', whereArgs: [username, password]);
        notifyListeners();
   
  }
}
