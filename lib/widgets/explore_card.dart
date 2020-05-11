//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:food_delivery/admin/pages/add_food_item.dart';
import 'package:food_delivery/models/food_model.dart';
import 'package:food_delivery/providers/food_items.dart';
import 'package:food_delivery/widgets/circularbutton.dart';
import 'package:provider/provider.dart';
class ExploreCard extends StatelessWidget {
  final Food food;
  ExploreCard(this.food);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onLongPress: () async{
          AlertDialog(
            title: Text("Deleting..."),
          );
          try{
            await Provider.of<FoodItems>(context,listen: false).deleteItem(food);
            Navigator.of(context).pop();
          }catch(err){
            Navigator.of(context).pop();
          }
        },
        onTap: ()async{
          await Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>AddFoodItem({
             "title":food.name,
            "category":food.category,
            "description":food.description,
            "discount":food.discount.toString(),
            "price":food.price.toString(),
            "id":food.id,

          })));
        },
              child: Container(
                    height: 150,
                    width: double.infinity,
                    
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                       
                      boxShadow: [
                              BoxShadow(
                                blurRadius: 5,
                                offset: Offset(1, 3),
                              )
                            ]
                          
                    ),
                    child: Row(
                      children: <Widget>[
                        SizedBox(width:MediaQuery.of(context).size.width*0.03 ,),
                        Container(
                          height: 110,
                          width: MediaQuery.of(context).size.width*0.3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(image: AssetImage("assets/images/breakfast.jpeg"),fit: BoxFit.cover)
                          ),
                          
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(food.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                                Text(food.description,style: TextStyle(color: Colors.grey,fontSize: 14),),
                                Row(
                                  children: <Widget>[
                                    Text("${food.price}",style: TextStyle(color: Colors.blue,fontStyle: FontStyle.italic),),
                                    Spacer(),
                                    CircularButton(text: "Buy",),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
      ),
    );
  }
}