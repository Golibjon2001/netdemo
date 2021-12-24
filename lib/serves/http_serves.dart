import 'dart:convert';

import 'package:http/http.dart';
import 'package:netdemo/model/post_model.dart';


class Network{


  static String BEST="dummy.restapiexample.com";

  /*Http Api*/
  static String API_LIST='/api/v1/employees';
  static String API_POST='/api/v1/create';
  static String API_DELIT='/api/v1/delete/';//{id}

  /*Http Request*/

  static Future<String> GET(String api,Map<String,String> req)async{
    var uri=Uri.http(BEST,api,req);
    var pdp=await get(uri);
    if(pdp.statusCode==200){
     return pdp.body;
    }
    return '';
  }

  static Future<String> POST(String api,Map<String,String> req)async{
    var uri=Uri.http(BEST,api);
    var pdp=await post(uri,body:jsonEncode(req));
    if(pdp.statusCode==200||pdp.statusCode==201){
      return pdp.body;
    }
    return '';
  }

  static Future<String> DELIT(String api,Map<String,String> req)async{
    var uri=Uri.http(BEST,api,req);
    var pdp=await delete(uri);
    if(pdp.statusCode==200){
      return pdp.body;
    }
    return '';
  }



  /*Http Params*/
 static Map<String,String> apiEmployee(){
   Map<String,String> chqar=Map();
   return chqar;
 }

  static Map<String,String> apiCreate(Post post){
    Map<String,String> chqar=Map();
    chqar.addAll({
      'name':post.name,
      'salary':post.salary,
      'age':post.age,
    });
    return chqar;
  }

  static Map<String,String> apiDelite(Post post){
    Map<String,String> chqar=Map();
    chqar.addAll({
      'id':post.id.toString(),
    });
    return chqar;
  }

}
