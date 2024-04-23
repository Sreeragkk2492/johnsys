

import 'package:johnsys/model/johnsys.dart';
import 'package:http/http.dart'as http;

class ApiHelper{
  static Future <List<Johnsys>> fetchproduct()async{

    var response= await http.get(Uri.parse('http://dotnetacademy.in/Item.ashx'));
       if(response.statusCode==200){
        var data=response.body;
        return johnsysFromJson(data); 
       }else{
        throw Exception();
       }
  }
}

