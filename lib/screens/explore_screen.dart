import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_model.dart';
import 'package:food_delivery/providers/food_items.dart';
import 'package:food_delivery/widgets/explore_card.dart';
import 'package:provider/provider.dart';
class ExploreScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    List<Food> foods= Provider.of<FoodItems>(context).foods;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount:foods.length,
            itemBuilder: (ctx,i)=>ExploreCard(foods[i]),
          ),
        ),
      ),
      
    );
  }
}