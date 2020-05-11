import 'package:flutter/material.dart';
import 'package:food_delivery/models/category_model.dart';
import '../data/categories_data.dart' as data;
import '../widgets/category_card.dart';
class HorizontalListCategories extends StatelessWidget {
  final List<Category> _categories= data.categories;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        itemBuilder: (ctx,index)=>CategoryCard(_categories[index]),
        
        
      ),
    );
  }
}