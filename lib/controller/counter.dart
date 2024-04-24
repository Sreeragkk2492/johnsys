import 'dart:async';

import 'package:flutter/material.dart';
import 'package:johnsys/controller/apihelper.dart';
import 'package:johnsys/model/johnsys.dart';
import 'package:johnsys/model/usermodel.dart';
import 'package:johnsys/services/databasesql.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CounterProvider extends ChangeNotifier {
// void increment(Johnsys john){
//   john.count++;
// }

  late Future<List<Johnsys>> _fetcheddata;

 SqlHelper sql=SqlHelper();

List <User>_user=[];

List <User> get currentuser=>_user;

  

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

 Future<void> registeruser(String username,String password)async{
  try{
  await SqlHelper.opendb();
   await SqlHelper.insertuser(User(username: username,password: password));
 notifyListeners();
  }catch(error){
    print(error);
  }
 }

 Future<void> loginuser(String username,String password)async{
 List<User>users =await SqlHelper.getuser(username, password); 
  
  _user=users;
  notifyListeners();


 }
  
 
}
