import 'package:flutter/material.dart';
class SearchTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(60),
      elevation: 5,
          child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(15),
          labelText: "Search any food",
          prefixIcon: Icon(Icons.search,color: Colors.black,),
          border: InputBorder.none
        ),
        
        
      ),
    );
  }
}