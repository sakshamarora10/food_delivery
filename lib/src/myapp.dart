import 'package:flutter/material.dart';
import 'package:food_delivery/admin/pages/add_food_item.dart';
import 'package:food_delivery/providers/food_items.dart';
import 'package:food_delivery/screens/auth_screen.dart';
import 'package:food_delivery/screens/bottombarscreen.dart';
import 'package:food_delivery/screens/homepage.dart';
import 'package:food_delivery/screens/login_screen.dart';
import 'package:food_delivery/screens/signup_screen.dart';
import 'package:food_delivery/providers/auth.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget func(Authenticate authData) {
      return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.blueAccent,
        ),
        home: authData.isTokenAvailable() ? MainScreen() : AuthScreen(),
      );
    }

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Authenticate>(create: (ctx) => Authenticate()),
        ChangeNotifierProxyProvider<Authenticate, FoodItems>(
            create: (ctx) => FoodItems(null, null, []),
            update: (ctx, auth, previosData) => FoodItems(
                auth.token,
                auth.userId,
                previosData.foods.isEmpty ? [] : previosData.foods))
      ],
      child: Consumer<Authenticate>(
        builder: (ctx, authData, child) => func(authData),
      ),
    );
  }
}

//       create: (ctx) => Authenticate(),
//       //value:Authenticate() ,
//       child:
//     );
//   }
// }
