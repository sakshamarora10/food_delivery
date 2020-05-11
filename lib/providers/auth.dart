import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:food_delivery/src/myapp.dart';
import 'package:http/http.dart' as http;

class Authenticate with ChangeNotifier{
  String _tokenID;
  String _userID;
  DateTime _validity;

  final API_KEY="API_KEY";


  String get token{
    print("inside token");
    if(_validity!=null&&_tokenID!=null&&_validity.isAfter(DateTime.now())){
      print("inside validity");
      return _tokenID;
    }
    else{print("outside"); return null;}
  }

  bool isTokenAvailable(){
    return token!=null;
  }

  String get userId{
    if(token!=null) return _userID;
    else return null;
  }


  Future<void> signup(String email,String password) async{
   try{
      var response=await http.post("https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$API_KEY",body: jsonEncode({
      "email":email,
      "password":password,
      "returnSecureToken":true,
    }));
    var responseData=jsonDecode(response.body);
    _tokenID=responseData['idToken'];
    _userID=responseData['localId'];
    _validity=DateTime.now().add(Duration(seconds: int.parse(responseData['expiresIn'])));
    notifyListeners();
   }catch(err){
     print(err);
     throw err;
   }
  }

  Future<void> login(String email,String password) async{
    try{
          var response=await http.post("https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$API_KEY",body: jsonEncode({
      "email":email,
      "password":password,
      "returnSecureToken":true,
    }));
    var responseData=jsonDecode(response.body);
    _tokenID=responseData['idToken'];
    _userID=responseData['localId'];
    _validity=DateTime.now().add(Duration(seconds: int.parse(responseData['expiresIn'])));
    notifyListeners();
    }catch(err){
      print(err);
      throw err;
    }
  }

}