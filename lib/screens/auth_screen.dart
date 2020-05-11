import 'package:flutter/material.dart';
import 'package:food_delivery/screens/login_screen.dart';
import 'package:food_delivery/screens/signup_screen.dart';
class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool showLogin=true;

  void toggle(){
    setState(() {
      showLogin=!showLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return showLogin?LoginScreen(toggle):SignUpScreen(toggle);
  }
}