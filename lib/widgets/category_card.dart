import 'package:flutter/material.dart';
import '../models/category_model.dart';
class CategoryCard extends StatelessWidget {
  final Category category;
  CategoryCard(this.category);
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
        child: Row(
          children: <Widget>[
            Image.asset(category.imagePath,fit: BoxFit.cover,),
            SizedBox(width: 10,),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(category.categoryName,style: TextStyle(fontWeight: FontWeight.bold),),
                Text("${category.numberOfItems} kinds",style: TextStyle(fontSize: 13),)
              ],
            )
          ],
        ),
      ),

      
    );
  }
}