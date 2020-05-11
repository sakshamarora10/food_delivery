import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/circularbutton.dart';

class UserAccountScreen extends StatefulWidget {
  @override
  _UserAccountScreenState createState() => _UserAccountScreenState();
}

class _UserAccountScreenState extends State<UserAccountScreen> {
  List<bool> _switches = [true, true];

  Widget accountTile(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
    );
  }

  Widget otherTile(String title) {
    return ListTile(
      title: Text(title),
    );
  }

  Widget notificationTile(String title, int switchVal) {
    return SwitchListTile(
      title: Text(title),
      value: _switches[switchVal],
      onChanged: (val) {
        setState(() {
          print(val);
          _switches[switchVal] = val;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Profile",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage:
                          AssetImage("assets/images/breakfast.jpeg"),
                      radius: 50,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            "Saksham Arora",
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            "9999222210",
                            style: TextStyle(color: Colors.grey),
                          ),
                          CircularButton(text: "Edit",),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Account",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 20,
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: <Widget>[
                        accountTile(Icons.location_on, "Location"),
                        Divider(),
                        accountTile(Icons.visibility, "Change Password"),
                        Divider(),
                        accountTile(Icons.shopping_cart, "Shipping"),
                        Divider(),
                        accountTile(Icons.payment, "Payment"),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Notifications",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 20,
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: <Widget>[
                        notificationTile("Notifications", 0),
                        Divider(),
                        notificationTile("Location Tracking", 1),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Other",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 20,
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: <Widget>[
                        otherTile("Language"),
                        Divider(),
                        otherTile("Currency"),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
