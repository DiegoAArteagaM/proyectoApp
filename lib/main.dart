import 'package:flutter/material.dart';
import 'package:formvalidation/src/pages/dashboard_page.dart';

import 'package:formvalidation/src/pages/home_page.dart';
import 'package:formvalidation/src/pages/login_page.dart';
import 'package:formvalidation/src/pages/registro_page.dart';

import 'src/pages/actualizar_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Material App",
        initialRoute: "/",
        routes: <String, WidgetBuilder>{
          "login": (BuildContext context) => LoginPage(),
          "registro": (BuildContext context) => InputPage(),
          "actualizar": (BuildContext context) => Actualizar(),
          "/dashboard":(BuildContext context) => Dashboard(),
          //"scan": (BuildContext context) => ScanPage(),
          "/" : (BuildContext context) => HomePage(),
        },
        theme: ThemeData(
          primaryColor: Colors.green

        ),
      );
    
    
    
  }
}