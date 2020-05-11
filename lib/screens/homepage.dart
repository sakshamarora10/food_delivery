import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_model.dart';
import 'package:food_delivery/providers/food_items.dart';
import 'package:provider/provider.dart';
import '../data/food_data.dart';
import 'package:food_delivery/widgets/categorylisthorizontal.dart';
import 'package:food_delivery/widgets/foodcard.dart';
import 'package:food_delivery/widgets/textcard.dart';
import '../widgets/searchtextfield.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  Widget foodCard(Food foodItem) {
    print("AAAAAAAAAAAAAAAAA");
    return FoodCard(foodItem);
  }

  @override
  void initState() {
    if(Provider.of<FoodItems>(context,listen: false).foods.isEmpty){
    Provider.of<FoodItems>(context,listen: false).fetchAndSetFoods();
    print("INIITTTTTTTTTTTTTTTTT");
    }
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Food> foods=Provider.of<FoodItems>(context).foods;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            TextCard(),
            SizedBox(
              height: 10,
            ),
            HorizontalListCategories(),
            SizedBox(
              height: 10,
            ),
            SearchTextField(),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "FREQUENTLY BOUGHT FOODS",
                  style: TextStyle(fontSize: 17),
                ),
                FlatButton(
                  child: Text(
                    "View All",
                    style: TextStyle(color: Colors.orangeAccent, fontSize: 17),
                  ),
                  onPressed: () {},
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
           foods.isEmpty?Center(child: CircularProgressIndicator(),): Column(
                  children: 
                  foods.map((item) {
                    
                    return foodCard(item);
                  }
                    ).toList(),
                ),
            
          ],
        ),
      ),
    );
  }
}
