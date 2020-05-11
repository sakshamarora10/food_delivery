import 'package:flutter/material.dart';
class CartCard extends StatefulWidget {
  @override
  _CartCardState createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  int value=0;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120,
        width: double.maxFinite,
        child: Card(
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
        height: 80,
        width: 60,
        decoration:  BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey,width: 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              InkWell(
                child: Container(
                  width: double.infinity,
                  child:const Icon(Icons.keyboard_arrow_up)),
                onTap: (){
                  setState(() {
                    value+=1;
                  });
                },
              ),
              Text("$value",style: TextStyle(fontSize: 18),),
              InkWell(
                child: Container(
                  width: double.infinity,
                  child: Icon(Icons.keyboard_arrow_down)),
                onTap: (){
                  setState(() {
                    value=value==0?0:value-1;
                  });
                },
              ),
            ],
        ),
                ),
                SizedBox(width: 20,),
                CircleAvatar(
        backgroundImage: AssetImage("assets/images/breakfast.jpeg"),
        radius: 40,
                ),
                SizedBox(width: 15,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Hot Coffee",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                      SizedBox(height: 10,),
                      Text("3.0",style: TextStyle(color: Colors.orangeAccent,fontSize: 15,fontStyle: FontStyle.italic),),
                      Expanded(
                                              child: ListView(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          children: <Widget>[
                            Text("Chicken",style: TextStyle(color: Colors.grey,fontSize: 16),),
                            SizedBox(width: 5,),
                            InkWell(
                              child: Text("X",style: TextStyle(color: Colors.red,fontSize: 16),),
                              onTap: null,
                            ),
                            SizedBox(width: 5,)

                          ],
                        ),
                      )
                    ],
                  ),
                ),
              InkWell(
                onTap: null,
                child: Icon(Icons.cancel),
              )
              ],
            ),
          ),
          ),
      );
      
  }
}