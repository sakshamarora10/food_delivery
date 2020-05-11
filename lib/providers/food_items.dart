import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:food_delivery/models/food_model.dart';
import 'package:http/http.dart' as http;

class FoodItems with ChangeNotifier{
  String tokenId;
  String userId;
  List<Food> _foods=[];
  FoodItems(this.tokenId,this.userId,this._foods);
  final url='FIREBASE_DATABASE_URL';

  List<Food> get foods{
    print("returning foods");
    return[..._foods];
  }
  
  Future addItem(Food foodItem) async{
    try{
      var response=await http.post('$url/foods.json?auth=$tokenId',body: jsonEncode(
        {
          'title':foodItem.name,
          'category':foodItem.category,
          'description':foodItem.description,
          'discount':foodItem.discount,
          'price':foodItem.price
        }
      ));

      foods.add(Food(
        category: foodItem.category,
        description: foodItem.description,
        discount: foodItem.discount,
        id: jsonDecode(response.body)['name'],
        name: foodItem.name,
        price: foodItem.price
      ));

      print("added food id=${jsonDecode(response.body)['name']}");
      notifyListeners();
    }catch(err){
      throw err;
    }
  }

  Future<void> fetchAndSetFoods() async {
    try{
      var response=await http.get('$url/foods.json?auth=$tokenId');
      var responseData=jsonDecode(response.body) as Map<String,dynamic>;
      _foods=[];
      responseData.forEach((foodId,item) {
        _foods.add(
          Food(
            category: item['category'],
            description: item['description'],
            discount: item['discount'],
            id: foodId,
            name: item['title'],
            price: item['price'],
          )
        );
      });
      notifyListeners();
      print("FETCHED");
    }catch(err){
      print (err);
    }
  }

  Future updateItem(Food foodItem) async{
    try{
    int index=  _foods.indexWhere((element) => element.id==foodItem.id);
      var response=await http.put('$url/foods/${foodItem.id}.json?auth=$tokenId',body: jsonEncode(
        {
          'title':foodItem.name,
          'category':foodItem.category,
          'description':foodItem.description,
          'discount':foodItem.discount,
          'price':foodItem.price
        }
      ));
      _foods[index]=foodItem;
      notifyListeners();
    }catch(err){
      throw err;
    }
  }

   Future deleteItem(Food foodItem) async{
    try{
   await http.delete('$url/foods/${foodItem.id}.json?auth=$tokenId');
   _foods.removeWhere((element) => element.id==foodItem.id);
      notifyListeners();
    }catch(err){
      throw err;
    }
  }



}