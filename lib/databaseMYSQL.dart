import 'dart:convert';

import 'package:http/http.dart' as http;

class userdata{
  String username;
  String password;
  userdata({this.username, this.password});
  factory userdata.fromJson(Map<String, dynamic> object){
    return userdata(
      username: object['USERNAME'],
      password: object['PASSWRD'],
    );
  }
  static parseResponse(List result){
    final parsed = result.cast<Map<String, dynamic>>();
    return parsed.map((e) => userdata.fromJson(e)).toList();
  }
}

class ConnecttoDatabase{
  static Future registerData({String username, String passwrd})async{
    final String url = "http://192.168.1.7/kuncikesuksesan/BELAJAR/registertodatabase.php";
    await http.post(
      url,
      body: {
        "username" : username,
        "passwrd" : passwrd
      }
    );
    return null;
  }

  static getUserData()async{
    final String url = 'http://192.168.1.7/kuncikesuksesan/BELAJAR/getuserdata.php';
    var response = await http.get(url);
    var result = jsonDecode(response.body);
    return userdata.parseResponse(result);
  }
}