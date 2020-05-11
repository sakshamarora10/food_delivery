import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_model.dart';

class FoodCard extends StatelessWidget {
  final Food foodItem;
  FoodCard(this.foodItem);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
          child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              child: Image.asset(
                "assets/images/breakfast.jpeg",
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                height: 70,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.black, Colors.black12],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter)),
              ),
            ),
            Positioned(
                bottom: 10,
                left: 5,
                right: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          foodItem.name,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.star,
                              color: Colors.orangeAccent,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.orangeAccent,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.orangeAccent,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.orangeAccent,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.orangeAccent,
                            ),
                            SizedBox(width: 15,),
                            Text(" 22 reviews", style: TextStyle(color: Colors.grey),)
                          ],
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(foodItem.price.toString(),style: TextStyle(color: Colors.orangeAccent,fontSize: 18,fontWeight: FontWeight.bold),),
                        
                        Text("Min order",style: TextStyle(color: Colors.grey,fontSize: 15),),
                      ],
                      
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
