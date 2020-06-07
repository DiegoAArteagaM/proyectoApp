import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:formvalidation/src/utils/routes_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Menu extends StatelessWidget {
  SharedPreferences _prefs;
  Menu(){

    SharedPreferences.getInstance().then((data){
      this._prefs =data;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
              image: DecorationImage(
              fit: BoxFit.cover,
              image:  AssetImage('data/menu-image.jpg'))),
              child: Stack(children: <Widget>[
                Positioned(
                  bottom: 12.0,
                  left: 16.0,
                  child: Text("Menú",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500))
                  ),
              ])
            ),
            ListTile(
              title: Row(
                children: <Widget>[
                  Icon(Icons.home, color: Colors.green),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text("Inicio"),
                  )
                ],
              ),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.pushNamed(context, Routes.dashboard);
                
              },
            ),
            ListTile(
              title: Row(
                children: <Widget>[
                  Icon(Icons.description, color: Colors.green),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text("Act. Información"),
                  )
                ],
              ),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.pushNamed(context, Routes.actualizar);
              },
            ),
            ListTile(
              title: Row(
                children: <Widget>[
                  Icon(Icons.compare, color: Colors.green),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text("Scanear Código"),
                  )
                ],
              ),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.pushNamed(context, Routes.scan);
              },
            ),
             ListTile(
              title: Row(
                children: <Widget>[
                  Icon(Icons.exit_to_app, color: Colors.green),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text("Salir"),
                  )
                ],
              ),
              onTap: (){
                SystemNavigator.pop();
              },
            ),
            
          ],
        ),
      );
  }
}