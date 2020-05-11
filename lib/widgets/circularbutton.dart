import 'package:flutter/material.dart';
class CircularButton extends StatelessWidget {
  final String text;
  CircularButton({this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
                            //height: 50,
                            width: 70,
                            padding: EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.blue,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: Text(
                                this.text,
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          );
  }
}