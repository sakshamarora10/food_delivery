import 'package:flutter/material.dart';
import 'package:food_delivery/screens/loading.dart';
import 'package:food_delivery/screens/login_screen.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';


class SignUpScreen extends StatefulWidget {
  Function toggle;
  SignUpScreen(this.toggle);
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String confirmPassword='';
  String error = '';
  bool loading=false;
  Future<void> _onsave() async {
    try {
      if (_formKey.currentState.validate()) {
        setState(() {
          loading=true;
        });
        await Provider.of<Authenticate>(context,listen: false).signup(email, password);
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
      } else if (err.code == 'ERROR_WEAK_PASSWORD') {
        setState(() {
          error = "Weak Password";
        });
      } else if (err.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
        setState(() {
          error = "User already exists";
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
        title: Text("SIGN UP"),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
            child: Text("Login"),
            onPressed: ()  {
              widget.toggle();
            },
          )
        ],
      ),
      body:Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
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
                SizedBox(height:20),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Confirm Password'),
                  obscureText: true,
                  validator: (val) {
                    if(val==password) return null;
                    else return "Password didnt match";
                  },
                  onChanged: (val) {
                    confirmPassword = val;
                  },
                ),
                SizedBox(height: 40,),
                RaisedButton(
                  color: Colors.pinkAccent[100],
                  child: Text("SIGN UP"),
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