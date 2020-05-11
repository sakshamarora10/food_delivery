import 'package:flutter/material.dart';
import 'package:food_delivery/screens/loading.dart';
import 'package:food_delivery/screens/signup_screen.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';

class LoginScreen extends StatefulWidget {
  Function toggle;
  LoginScreen(this.toggle);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';
  bool loading=false;
  Future<void> _onsave() async {
    try {
      if (_formKey.currentState.validate()) {
        setState(() {
          loading=true;
        });
        await Provider.of<Authenticate>(context,listen: false).login(email, password);
      }
    } catch (err) {
      setState(() {
        loading=false;
      });
      //the error would be of type Object of PlatformException
      if (err.code == 'ERROR_INVALID_EMAIL') {
        setState(() {
          error = "Invalid email";
        });
      } else if (err.code == 'ERROR_WRONG_PASSWORD') {
        setState(() {
          error = "Wrong Password";
        });
      } else if (err.code == 'ERROR_USER_NOT_FOUND') {
        setState(() {
          error = "No user found";
        });
      } else {
        setState(() {
          error = "An error occured";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return loading?LoadingScreen(): Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: Text("LOGIN"),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
            child: Text("Sign up"),
            onPressed: () {
              widget.toggle();
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email'),
                  validator: (val) {
                    return val.isEmpty ? "Enter your email" : null;
                  },
                  onChanged: (val) {
                    email = val;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: (val) {
                    return val.isNotEmpty
                        ? (val.length >= 6
                            ? null
                            : "Password must be atleast 6 characters long")
                        : "Enter Password";
                  },
                  onChanged: (val) {
                    password = val;
                  },
                ),
                SizedBox(height: 40,),
                RaisedButton(
                  color: Colors.pinkAccent[100],
                  child: Text("Login"),
                  onPressed: () async {
                    setState(() {
                      error='';
                    });
                    _onsave();
                  },
                ),
                SizedBox(height: 10,),
                if(error.isNotEmpty)
                Center(
                  child: Text(error),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}