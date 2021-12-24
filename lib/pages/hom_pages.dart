import 'package:flutter/material.dart';
import 'package:netdemo/model/post_model.dart';
import 'package:netdemo/serves/http_serves.dart';
class HomPage extends StatefulWidget {
  const HomPage({Key? key}) : super(key: key);

  @override
  _HomPageState createState() => _HomPageState();
}

class _HomPageState extends State<HomPage> {
  String data='';

   _apiList(){
     Network.GET(Network.API_LIST, Network.apiEmployee()).then((online) => {
       print(online),
       _showrespons(online),
     });
   }

  _apiPost(Post post){
    Network.POST(Network.API_POST, Network.apiCreate(post)).then((online) => {
      print(online),
      _showrespons(online),
    });
  }

  _apiDelit(Post post){
    Network.DELIT(Network.API_DELIT+post.id.toString(), Network.apiDelite(post)).then((online) => {
      print(online),
      _showrespons(online),
    });
  }

   _showrespons(String online){
     setState(() {
       data=online;
     });
   }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var post=Post(name: 'test',salary: '23', age: '123',id: 2);
    _apiDelit(post);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(data=data),
      ),
    );
  }
}
