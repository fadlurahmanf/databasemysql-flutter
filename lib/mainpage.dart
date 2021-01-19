import 'dart:convert';

import 'package:belajar/databaseMYSQL.dart';
import 'package:belajar/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart' as dbmongo;
import 'package:http/http.dart' as http;

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final _key = GlobalKey<FormState>();

    TextEditingController username = TextEditingController();
    TextEditingController passwrd = TextEditingController();

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Form(
          key: _key,
          child: Column(
            children: <Widget>[
              SizedBox(height: 250,),
              TextField(
                controller: username,
                decoration: InputDecoration(
                  hintText: 'Username'
                ),
              ),
              TextField(
                controller: passwrd,
                decoration: InputDecoration(
                    hintText: 'Password'
                ),
              ),
              RaisedButton(onPressed: ()async{
                await ConnecttoDatabase.registerData(username: username.text, passwrd: passwrd.text);
              },child: Text('REGISTER'),),
              RaisedButton(
                onPressed: ()async{
                  var result = await ConnecttoDatabase.getUserData();
                  List<userdata> data = result;
                  print(data[0].username);
                  // List<userdata> data = result;
                  // print(data[0].username);
                },
                child: Text('GET DATA'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

