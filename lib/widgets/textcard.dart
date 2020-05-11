import 'package:flutter/material.dart';
class TextCard extends StatelessWidget {
  final textstyle=TextStyle(fontSize: 25,fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("WHAT WOULD",style: textstyle,),
        Text("YOU LIKE TO HAVE?",style: textstyle,)
      ],
            ),
            Icon(Icons.notifications_none,size: 40,)
          ],
        ),
      
    );
  }
}