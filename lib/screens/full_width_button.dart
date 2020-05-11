import 'package:flutter/material.dart';
class FullWidthButton extends StatelessWidget {
  final String text;
  FullWidthButton({this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      // width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Theme.of(context).primaryColor,
      ),
      child: Center(
          child: Text(
        text,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold),
      )),
    );
  }
}