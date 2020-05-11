import 'package:flutter/material.dart';
import 'package:food_delivery/providers/food_items.dart';
import 'package:food_delivery/screens/cartscreen.dart';
import 'package:food_delivery/screens/explore_screen.dart';
import 'package:food_delivery/screens/homepage.dart';
import 'package:food_delivery/screens/user_account_screen.dart';
import 'package:provider/provider.dart';
class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex=0;
  List<Widget> screens;
  void changeIndex(int index){
    setState(() {
      currentIndex=index;
    });
  }
  @override
  void initState() {
    screens=[
      Homepage(),
      ExploreScreen(),
      CartScreen(),
      UserAccountScreen()
    ];
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: changeIndex,
        currentIndex: currentIndex,
        backgroundColor: Colors.black,

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),title: Text("Home"),backgroundColor: Colors.orangeAccent),
          BottomNavigationBarItem(icon: Icon(Icons.fastfood),title: Text("Explore"),backgroundColor: Colors.orangeAccent),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),title: Text("Cart"),backgroundColor: Colors.orangeAccent),
          BottomNavigationBarItem(icon: Icon(Icons.person),title: Text("Account"),backgroundColor: Colors.orangeAccent),          
        ],
      ),
      body: screens[currentIndex],
      
    );
  }
}